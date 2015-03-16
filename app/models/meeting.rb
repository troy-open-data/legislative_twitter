# == Schema Information
#
# Table name: meetings
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  date            :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  docket_id       :integer
#

class Meeting < ActiveRecord::Base
  # Model Relationships
  belongs_to :organization
  has_one :docket, dependent: :destroy
end
