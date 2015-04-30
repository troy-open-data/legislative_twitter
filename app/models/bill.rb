# == Schema Information
#
# Table name: bills
#
#  id               :integer          not null, primary key
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  legislation_type :string           default("Resolution"), not null
#  short_title      :string
#  enacting_formula :string
#
class Bill < ActiveRecord::Base
  LEGISLATION_TYPES = %w(Resolution Ordinance)
  NULL_ATTRS        = %w(short_title)

  before_save :nil_if_blank
  before_validation :set_defaults

  scope :resolutions, -> { where(legislation_type: 'Resolution') }
  scope :ordinances,  -> { where(legislation_type: 'Ordinance') }
  scope :by_recent,   -> { order('created_at DESC') }

  has_many :recitals, dependent: :destroy
  accepts_nested_attributes_for :recitals,
                                reject_if: ->(attr) { attr[:clause].blank? },
                                allow_destroy: true

  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections,
                                allow_destroy: true

  has_many :motions,   dependent: :destroy
  has_many :meetings, through:   :folios

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments,
                                reject_if: ->(attr) { attr[:file].blank? },
                                allow_destroy: true
  has_paper_trail
  paginates_per 10

  validates :title,             presence: true
  validates :short_title,       presence: true
  validates :legislation_type,  presence: true,
                                inclusion: LEGISLATION_TYPES
  validates :enacting_formula,  presence: true

  # @return [String] Returns a string containing the created_at time in the
  #   format Month day, Year:
  #   @bill.created_at_time  # => "Added March 4, 2015"
  def created_at_time
    created_at.strftime('Added %B %d, %Y')
  end

  # @example
  #   @bill.list_changed_attributes   # => "title, short_title"
  #
  # @param [Version] version
  # @return [String] Returns a comma-separated list of changed attributes
  #   between instance and version
  def list_changed_attributes(version = versions.last)
    diff_attributes(version).join(', ')
  end

  # Returns all changed attributes between given and current version except for
  # specifically ignored attributes (created_at, updated_at, id)
  # Example: @bill.diff_attributes  # => ['title', 'short_title']
  def diff_attributes(version = versions.last,
                      ignored = %w(created_at updated_at id))
    version.changeset.keys - ignored
  end

  # @param [Symbol] format
  # @return [Object] Returns the legislative numbering of a bill, formatted as a
  #   string (default), array, integer, or abbreviated string
  #
  # @example
  #   @bill.numbering                # => "Ordinance 5"
  #   @bill.numbering(:string)       # => "Ordinance 5"
  #   @bill.numbering(:array)        # => ["Ordinance", 5]
  #   @bill.numbering(:integer)      # => 5
  #   @bill.numbering(:abbreviation) # => "ORD. #5"
  #   @bill.numbering(:dne)          # => "dne is not supported"
  def numbering(format = :string)
    index = bill_index
    case format
    when :string        then legislation_type + ' ' + index.to_s
    when :array         then [legislation_type, index]
    when :integer       then index
    when :abbreviation  then legislation_type[0..2].upcase + '. #' + index.to_s
    else
      fail StandardError, "#{format} is not supported"
    end
  end

  # @return [Integer] Returns the index of the resolution or ordinance
  def bill_index
    Bill.where(legislation_type: legislation_type).order('created_at ASC')
      .index(self) + 1
  end

  # @return [Bill] Returns the most recently updated bill
  def self.latest
    Bill.all.order('updated_at').last
  end

  private

  def set_defaults
    self.enacting_formula ||= 'Let it be hereby resolved'
  end

  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end
end
