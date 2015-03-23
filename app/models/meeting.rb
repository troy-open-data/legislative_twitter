# == Schema Information
#
# Table name: meetings
#
#  id               :integer          not null, primary key
#  organization_id  :integer
#  date_and_time    :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  agenda_approved  :boolean
#  minutes_approved :boolean
#  location         :string
#

class Meeting < ActiveRecord::Base
  DEFAULT_LOCATION='Suite 5, 433 River Street, Troy, NY 12180'

  # Model Relationships
  belongs_to :organization

  has_many :folios, dependent: :destroy
  has_many :legislations, through: :folios
  accepts_nested_attributes_for :folios,
                                allow_destroy: true

  # Validations
  validates_presence_of :organization, :date_and_time

  # Aliases
  alias_attribute :'approved_agenda?', :agenda_approved
  alias_attribute :'approved_minutes?', :minutes_approved
  alias_attribute :date, :date_and_time


  # INSTANCE METHODS
  # Returns array of grouped legislation
  def grouped_legislations
    legislations.uniq.sort_by{|l| l.created_at}.group_by{|l| l.legislation_type}
  end

  # Returns calculated name of meeting of the form <Organization> Meeting on <date>
  def name
    self.organization.name + ' Meeting on ' + self.date.to_formatted_s(:long_ordinal)
  end

  def datetimepicker_value
    (self.date_and_time ? self.date_and_time : DateTime.current.advance(weeks:2)).
        strftime('%Y/%m/%d %R')
  end

  # Status Methods
  def has_happened?
    Date.today >= self.date
  end
  alias is_started? has_happened?

  def toggle_approval(document)
    case document
      when :agenda
        self.agenda_approved = !self.agenda_approved
      when :minutes
        self.minutes_approved = !self.minutes_approved
    end
    self.save!
  end

end
