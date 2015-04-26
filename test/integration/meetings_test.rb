require 'test_helper'

class MeetingsTest < ActionDispatch::IntegrationTest
  context 'a meeting with a bill and a member' do
    setup do
      @meeting = create(:meeting_with_bill)
      @meeting.organization.people << create(:person)
      @path = "/meetings/#{@meeting.id}"
    end
    context 'agenda' do
      setup { @path << '/agenda' }
      should 'load html' do
        get @path, format: :html
        assert_response :success
      end
      should 'load pdf' do
        get @path, format: :pdf
        assert_response :success
      end
      should 'toggle approval' do
        @path << '/toggle'
        xhr :get, @path, format: 'js'
        assert_response :success
      end
    end

    context 'minutes' do
      setup { @path << '/minutes' }
      should 'load html' do
        get @path, format: :html
        assert_response :success
      end
      should 'load pdf' do
        get @path, format: :pdf
        assert_response :success
      end
      should 'toggle approval' do
        @path << '/toggle'
        xhr :get, @path, format: 'js'
        assert_response :success
      end
    end

    context 'start_meeting' do
      setup { @path << '/in_progress' }
      should 'load' do
        get @path, format: :html
        assert_response :success
      end
    end
  end
end