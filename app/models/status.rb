# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Status < ActiveRecord::Base
  # Model Relationships
  has_many :status_updates, dependent: :destroy
  # has_one :legislation, through: :status_updates
end
