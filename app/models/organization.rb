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
  LEVEL_NAMES=['Mayor', 'General Assembly', 'Committee', 'Subcommittee']

  # Model Relationships
  has_many :meetings
end
