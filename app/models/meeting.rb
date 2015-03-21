# == Schema Information
#
# Table name: meetings
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  date            :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Meeting < ActiveRecord::Base
  # Model Relationships
  belongs_to :organization

  has_many :folios, dependent: :destroy
  has_many :legislations, through: :folios
  accepts_nested_attributes_for :folios,
                                allow_destroy: true

  # Validations
  validates_presence_of :organization, :date
  validates :date, format: {
                     with: /\d{4}\-[01]\d-[0123]\d/,
                     message: 'date must be in the format of yyyy-mm-dd' }


  # Methods
  def grouped_legislations
    legislations.uniq.sort_by{|l| l.created_at}.group_by{|l| l.legislation_type}
  end

  def name
    self.organization.name + ' Meeting on ' + self.date.to_formatted_s(:long)
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

  def approve(document)
    case document
      when :agenda then agenda_approved = true
      when :minutes then minutes_approved = true
    end
  end

  def revoke_approval(document)
    case document
      when :agenda then agenda_approved = false
      when :minutes then minutes_approved = false
    end
  end
end
