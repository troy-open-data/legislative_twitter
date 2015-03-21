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

  before_save :add_time_to_meeting_date

  # Model Relationships
  belongs_to :organization

  has_many :folios, dependent: :destroy
  has_many :legislations, through: :folios
  accepts_nested_attributes_for :folios,
                                allow_destroy: true

  # Validations
  validates_presence_of :organization, :date_and_time
  # validates :date, format: {
  #                    with: /\d{4}\-[01]\d-[0123]\d/,
  #                    message: 'date must be in the format of yyyy-mm-dd' }


  # Methods
  def grouped_legislations
    legislations.uniq.sort_by{|l| l.created_at}.group_by{|l| l.legislation_type}
  end

  # Returns calculated name of meeting of the form <Organization> Meeting on <date>
  def name
    self.organization.name + ' Meeting on ' + self.date.to_formatted_s(:long_ordinal)
  end

  # Returns just date of meeting
  def date
    self.date_and_time.to_date
  end

  # Returns just time of meeting
  def time
    self.date_and_time.to_time
  end

  def is_started?
    Date.today >= self.date
  end

  def has_happened?
    Date.today > self.date
  end

  # Agenda and minutes approval methods
  def approved_agenda?
    agenda_approved
  end

  def approved_minutes?
    minutes_approved
  end

  def toggle_approval(document)
    case document
      when :agenda
        self.agenda_approved = !self.agenda_approved
      when :minutes
        self.minutes_approved = !self.minutes_approved
    end
    self.save!
  end

  private

  # Hooks
  def add_time_to_meeting_date
    self.date_and_time = self.date_and_time.at_noon
  end
end
