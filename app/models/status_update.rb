# == Schema Information
#
# Table name: status_updates
#
#  id             :integer          not null, primary key
#  legislation_id :integer
#  status_id      :integer
#  notes          :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class StatusUpdate < ActiveRecord::Base
  # Model Relationships
  belongs_to :legislation
  belongs_to :status
end
