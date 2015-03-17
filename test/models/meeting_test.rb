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

require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
