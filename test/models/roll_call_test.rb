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

  should validate_inclusion_of(:type).in_array(RollCall::TYPES)
  should 'have a default type of Pass' do
    roll_call = create(:roll_call)
    assert_equal 'Pass', roll_call.type
  end

  context 'RollCall' do
    context '#select_method' do
      should 'return a zipped array including roll call types' do
        select = RollCall.select_text.flatten
        assert_equal [], RollCall::TYPES - select
      end
    end
  end

  context 'roll_call' do
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
