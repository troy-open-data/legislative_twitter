require 'test_helper'

class MeetingsApiTest < ActionDispatch::IntegrationTest
  setup do
    @meeting = create(:meeting)
  end
  test 'returns list of all meetings' do
    get '/api/meetings', {},
        { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

    assert_response :success
    assert_equal Mime::JSON, response.content_type
  end

  test 'list of meetings includes meeting urls' do
    get '/api/meetings', {},
        { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

    assert_response :success

    meeting_data = json(response.body)[0]
    assert_equal api_meeting_url(meeting_data[:id], format: :json),
                 meeting_data[:url]
  end

  test 'returns meeting by id' do
    get "/api/meetings/#{@meeting.id}", {},
        { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    meeting = json(response.body)
    assert_equal @meeting.id, meeting[:id]
  end
end