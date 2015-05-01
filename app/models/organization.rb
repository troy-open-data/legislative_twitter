# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  level       :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

class Organization < ActiveRecord::Base
  # Model Variables
  LEVELS = ['Mayor', 'General Assembly', 'Committee', 'Subcommittee']

  # Scopes
  scope :meetable, -> { where.not(level: 0).order('level DESC') }

  # Model Relationships
  has_many :meetings
  has_many :memberships, dependent: :destroy
  has_many :people, through: :memberships

  # Validations
  validates :name,  presence: true
  validates :level, presence: true,
                    inclusion: { in: 0...(LEVELS.length) }
end
