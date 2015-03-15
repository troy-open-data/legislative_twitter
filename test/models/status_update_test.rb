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

require 'test_helper'

class StatusUpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
