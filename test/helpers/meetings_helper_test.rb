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
      setup { @roll_call = create(:roll_call) }
      context '#print_votes' do
        context 'with no votes' do
          should 'return string of vote summary' do
            assert_equal 'no vote recorded', print_votes(@roll_call)
          end
        end
        context 'with votes' do
          setup { @roll_call.votes << create(:vote, roll_call: @roll_call) }
          should 'return string of vote summary' do
            assert_match(/\d-\d-\d/, print_votes(@roll_call))
          end
        end
      end
    end
  end
end
