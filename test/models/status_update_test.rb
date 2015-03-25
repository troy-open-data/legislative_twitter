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
  ## Setup and Teardown ########################################################
  def setup
    @status_update = create(:status_update)
  end

  ## Associations ##############################################################
  test 'belongs to one legislation' do
    assert @status_update.respond_to? :legislation
  end
  test 'belongs to one status' do
    assert @status_update.respond_to? :status
  end
end
