require 'test_helper'

class PageLayoutTest < ActionDispatch::IntegrationTest
  context 'page titles' do
    should 'render correctly' do
      get bills_path
      assert_select 'title', 'Bills | Troy City Tracker'

      bill = create(:bill)
      get bill_path bill
      assert_select 'title', "#{bill.numbering} | Troy City Tracker"

      get meetings_path
      assert_select 'title', 'Meetings | Troy City Tracker'

      meeting = create(:meeting)
      get meeting_path meeting
      assert_select 'title', "#{meeting.name} | Troy City Tracker"
    end
  end
end
