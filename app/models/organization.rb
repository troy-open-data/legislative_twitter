# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  level      :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ActiveRecord::Base
  # Model Variables
  LEVELS=['Mayor', 'General Assembly', 'Committee', 'Subcommittee']

  # Model Relationships
  has_many :meetings

  # Validations
  validates_presence_of :name, :level

  # Returns array of organizations with a level greater than 0, ordered by
  # lower-level (higher number) organizations first.
  def self.meetable
    Organization.where.not(level: 0).order('level DESC').all
  end
end
