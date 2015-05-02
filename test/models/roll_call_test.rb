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
  should belong_to(:motion)
  should have_many(:votes)
  should accept_nested_attributes_for(:votes)

  context 'a valid roll call' do
    should 'have a default type of Accept/Reject' do
      roll_call = create(:roll_call)
      assert_equal Pass.name, roll_call.type
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
