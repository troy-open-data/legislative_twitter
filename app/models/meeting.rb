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

  def has_happened?
    Date.today > self.date
  end

  def v
    true
  end

  def approved_minutes?
    false
  end
end
