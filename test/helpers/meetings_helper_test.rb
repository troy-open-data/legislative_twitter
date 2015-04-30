require 'test_helper'

class MeetingsHelperTest < ActionView::TestCase
  include MeetingsHelper

  context 'given a meeting' do
    setup { @meeting = create(:meeting) }
    context '#list_attendances' do
      context 'with no attendees' do
        should 'return "no attendees"' do
          assert_equal 'no attendees', list_attendees(@meeting)
        end
      end
      context 'with attendees' do
        setup { @meeting.people << create(:person) }
        should 'include attendee name' do
          assert_match(/#{@meeting.people[0].name}/, list_attendees(@meeting))
        end
      end
    end

    context 'given a motion' do
      setup { @motion = create(:motion) }
      context '#print_votes' do
        context 'with no votes' do
          should 'return string of vote summary' do
            assert_equal 'no vote recorded', print_votes(@motion)
          end
        end
        context 'with votes' do
          setup { @motion.votes << create(:vote, motion: @motion) }
          should 'return string of vote summary' do
            assert_match(/\d-\d-\d/, print_votes(@motion))
          end
        end
      end
    end
  end
end
