# == Schema Information
#
# Table name: bills
#
#  id               :integer          not null, primary key
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  type             :string           default("Resolution"), not null
#  short_title      :string
#  enacting_formula :string
#  position         :integer
#

class Bill < ActiveRecord::Base
  TYPES       = %w(Resolution Ordinance)
  NULL_ATTRS  = %w(short_title)

  before_save :nil_if_blank
  before_validation :set_defaults

  # no single table inheritance
  self.inheritance_column = nil

  scope :resolutions, -> { where(type: 'Resolution') }
  scope :ordinances,  -> { where(type: 'Ordinance') }
  scope :by_recent,   -> { order('created_at DESC') }

  has_many :recitals, dependent: :destroy
  accepts_nested_attributes_for :recitals,
                                reject_if: ->(attr) { attr[:clause].blank? },
                                allow_destroy: true

  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections,
                                allow_destroy: true

  has_many :motions,   dependent: :destroy
  has_many :questions, through: :motions

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments,
                                reject_if: ->(attr) { attr[:file].blank? },
                                allow_destroy: true
  has_paper_trail
  paginates_per 10
  acts_as_list scope: [:type]

  validates :title,             presence:  true
  validates :short_title,       presence:  true
  validates :type,              presence:  true,
                                inclusion: TYPES
  validates :enacting_formula,  presence:  true

  # @example
  #   @bill.diff_attributes  # => 'title, short_title'
  # @param [Version] version
  # @return [String] Returns a comma-separated attributes diff
  def list_changed_attributes(version = versions.last)
    diff_attributes(version).join(', ')
  end

  # @example
  #   @bill.diff_attributes  # => ['title', 'short_title']
  # @param [Version] version
  # @param [Array] ignored
  # @return [Array]
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
  #   @bill.numbering(:abbreviation) # => "ORD. #5"
  #   @bill.numbering(:dne)          # => "dne is not supported"
  def numbering(format = :string)
    case format
    when :string        then "#{type} #{position}"
    when :abbreviation  then "#{type[0..2].upcase}. ##{position}"
    else
      fail StandardError, "#{format} is not supported"
    end
  end

  # @return [Bill] Returns the most recently updated bill
  def self.latest
    Bill.order('updated_at').last
  end

  # @return [String] Label for collection check boxes ('RES #3 Short Title')
  def collection_text_method
    "#{numbering(:abbreviation)}  #{short_title}"
  end

  private

  def set_defaults
    self.enacting_formula ||= 'Let it be hereby resolved'
  end

  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end
end
