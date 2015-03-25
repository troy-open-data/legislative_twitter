# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  ## Setup and Teardown ########################################################
  def setup
    @status = create(:status)
  end

  ## Associations ##############################################################
  test 'has many status_updates' do
    assert @status.respond_to? :status_updates
  end
  test 'can destroy dependent status updates' do
    @status_update = StatusUpdate.new(status: @status)
    @status_update.save!
    assert StatusUpdate.exists? @status_update.id

    @status.destroy!
    refute StatusUpdate.exists? @status_update.id
  end
end
