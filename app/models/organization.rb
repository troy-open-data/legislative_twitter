class Organization < ActiveRecord::Base
  # Model Variables
  LEVEL_NAMES=['Mayor', 'General Assembly', 'Committee', 'Subcommittee']

  # Model Relationships
  has_many :meetings
end
