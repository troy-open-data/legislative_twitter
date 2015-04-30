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
  context 'a valid motion' do
    setup do
      @motion = create(:motion)
    end

    context 'with associations' do
      should 'belong to a bill' do
        assert should_belong_to(Motion, :bill)
      end
      should 'belong to a meeting' do
        assert should_belong_to(Motion, :meeting)
      end
      should 'have many people (sponsors) through sponsorships' do
        assert should_have_many_through(Motion, :sponsors, :sponsorships)
      end
      should 'have many people (voters) through votes' do
        assert should_have_many_through(Motion, :voters, :votes)
      end
    end
  end

  context 'motion' do
    setup do
      @motion = create(:motion)
    end

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
