# == Schema Information
#
# Table name: bills
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  legislation_type :string           default("Resolution"), not null
#  short_title      :string
#  enacting_formula :string
#

class Bill < ActiveRecord::Base
  # Model Variables
  LEGISLATION_TYPES = %w{ Resolution Ordinance }
  NULL_ATTRS = %w( short_title )

  # Hooks
  before_save :clean_html
  before_save :nil_if_blank
  before_validation :set_defaults

  # Scopes
  scope :resolutions, -> { where(legislation_type: 'Resolution') }
  scope :ordinances,  -> { where(legislation_type: 'Ordinance') }
  scope :by_recent,   -> { order('created_at DESC') }

  # Model Relationships
  has_many :recitals, dependent: :destroy
  accepts_nested_attributes_for :recitals,
                                reject_if: lambda {|attribute| attribute[:clause].blank?},
                                allow_destroy: true

  has_many :sections, dependent: :destroy

  has_many :folios,   dependent: :destroy
  has_many :meetings, through:   :folios

  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments,
                                reject_if: lambda {|attribute| attribute[:file].blank?},
                                allow_destroy: true
  has_paper_trail
  paginates_per 5

  # Validations
  validates_presence_of :title, :short_title, :body,
                        :legislation_type, :enacting_formula
  validates :legislation_type, inclusion: LEGISLATION_TYPES




  # Returns a string containing the created_at time in the
  # format Month day, Year:
  # @bill.created_at_time  # => "Added March 4, 2015"
  def created_at_time
    created_at.strftime('Added %B %d, %Y')
  end

  # Returns a comma-separated list of changed attributes between
  # instance and version
  # Example: @bill.list_changed_attributes   # => "title, short_title"
  def list_changed_attributes(version=versions.last)
    diff_attributes(version).join(", ")
  end

  # Returns all changed attributes between given and current version except for
  # specifically ignored attributes (created_at, updated_at, id)
  # Example: @bill.diff_attributes  # => ['title', 'short_title']
  def diff_attributes(version=versions.last,
                      ignored_changes=%w{ created_at updated_at id })
    version.changeset.keys - ignored_changes
  end

  # Returns the legislative numbering of a bill, formatted as a
  # string (default), array, integer, or abbreviated string
  #
  # Example:
  # @bill.legislative_numbering                # => "Ordinance 5"
  # @bill.legislative_numbering(:string)       # => "Ordinance 5"
  # @bill.legislative_numbering(:array)        # => ["Ordinance", 5]
  # @bill.legislative_numbering(:integer)      # => 5
  # @bill.legislative_numbering(:abbreviation) # => "ORD. #5"
  # @bill.legislative_numbering(:unsupported)  # => "unsupported is not supported"
  def legislative_numbering(output_type=:string)
    index = Bill.where(legislation_type: legislation_type)
                .order('created_at ASC').index(self) + 1

    case output_type
      when :string then legislation_type + ' ' + index.to_s
      when :array then [legislation_type,index]
      when :integer then index
      when :abbreviation then legislation_type[0..2].upcase + '. #' + index.to_s
      else
        raise StandardError, "#{output_type.to_s} is not supported"
    end
  end

  def collection_text_method
    index = Bill.where(legislation_type: legislation_type)
                .order('created_at ASC').index(self) + 1
    legislation_type[0..2] + ' ' + index.to_s + ': ' + (short_title || title.truncate(72))
  end

  # Returns the most recently updated bill
  def self.latest
    Bill.all.order('updated_at').last
  end


  private

  def set_defaults
    self.enacting_formula ||= 'Let it be hereby resolved'
  end


  # Allows only whitelisted tags in body richtext
  def clean_html
    # self.body = Sanitize.fragment(body, Sanitize::Config::BASIC)
    self.body = Sanitize.fragment(body,
                                  elements: %w{b i u strikethrough strike sub sup h1 h2 h3 h4 h5 h6 p b},
                                  attributes: {})
  end

  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end

end
