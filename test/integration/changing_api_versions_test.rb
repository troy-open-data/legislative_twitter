require 'test_helper'

class ChangingApiVersionsTest < ActionDispatch::IntegrationTest
  test 'return Version One via the Accept header' do
    get '/api', {}, 'Accept:' => 'application/vnd.troycitycouncil.v1+json'
    assert_response :success

    meta = json(response.body)
    assert_equal 'v1', meta[:api_version]
    assert_equal Mime::JSON, response.content_type
  end
end
