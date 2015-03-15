# == Schema Information
#
# Table name: legislations
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Legislation < ActiveRecord::Base
  # Hooks
  before_save :clean_html

  # Model Relationships
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments,
                                reject_if: lambda {|attribute| attribute[:file].blank?},
                                allow_destroy: true
  has_paper_trail
  paginates_per 5

  # Model Variables
  LEGISLATION_TYPES = %w{ Resolution Ordinance }

  # Validations
  validates_presence_of :title, :body, :legislation_type
  validates :legislation_type, inclusion: LEGISLATION_TYPES




  def created_at_time
    created_at.strftime('Added %B %d, %Y')
  end

  def list_changed_attributes(version)
    diff_attributes(version).join(", ")
  end

  # Returns the legislative numbering of a legislation, formatted in several ways
  def legislative_numbering(output_type=:string)
    index = Legislation.where(legislation_type: legislation_type)
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

  # Returns all changed attributes between given and current version except for
  # specifically ignored attributes (created_at, updated_at, id)
  def diff_attributes(version=versions.last, ignored_changes=%w{ created_at updated_at id })
    version.changeset.keys - ignored_changes
  end

  # For caching purposes
  def self.latest
    Legislation.all.order('updated_at').last
  end


  private


  # Allows only whitelisted tags in body richtext
  def clean_html
    # self.body = Sanitize.fragment(body, Sanitize::Config::BASIC)
    self.body = Sanitize.fragment(body,
                                  elements: %w{b i u strikethrough strike sub sup h1 h2 h3 h4 h5 h6 p br},
                                  attributes: {})
  end

end
