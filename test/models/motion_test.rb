# == Schema Information
#
# Table name: motions
#
#  id         :integer          not null, primary key
#  meeting_id :integer
#  bill_id    :integer
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MotionTest < ActiveSupport::TestCase
  # Associations
  should belong_to(:bill)
  should belong_to(:meeting)
  should have_many(:sponsors).through(:sponsorships)
  should have_many(:roll_calls)
  should have_many(:votes).through(:roll_calls)

  context 'motion' do
    setup { @motion = create(:motion) }

    context '#sponsors' do
      context 'when there are no sponsors' do
        should 'return "no recorded sponsors"' do
          assert_equal 'no recorded sponsors', @motion.sponsors_list
        end
      end
      context 'when there are sponsors' do
        setup { @motion.sponsors << create(:person) }

        should 'contain sponsor names' do
          assert_match(/#{@motion.sponsors[0].name}/, @motion.sponsors_list)
        end
      end
    end
  end
end
