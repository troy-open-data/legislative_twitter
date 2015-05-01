# == Schema Information
#
# Table name: roll_calls
#
#  id         :integer          not null, primary key
#  type       :string
#  notes      :text
#  motion_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  passed     :boolean
#

require 'test_helper'

class RollCallTest < ActiveSupport::TestCase
  context 'a valid roll call' do
    should 'belong to a motion' do
      assert should_belong_to RollCall, :motion
    end
    should 'have many votes' do
      assert should_have_many RollCall, :votes
    end
    should 'have a default type of Accept/Reject' do
      roll_call = create(:roll_call)
      assert_equal Pass.name, roll_call.type
    end
    context 'with validations' do
      # should 'ensure type is selected from allowed types' do
      #   assert_raise(ActiveRecord::RecordInvalid) do
      #     build(:roll_call, type: 'Not Allowed').save!
      #   end
      # end
      # should 'have a type' do
      #   assert should_validate_presence_of :type, :roll_call
      # end
    end
  end

  context 'roll call' do
    context '#result' do
      should 'return "Passed" if passed' do
        rc = create(:roll_call, passed: true)
        assert_equal 'Passed', rc.result
      end
      should 'return "Failed" if not passed' do
        rc = create(:roll_call, passed: false)
        assert_equal 'Failed', rc.result
      end
    end
  end
end
