require 'test_helper'

class DataApiTest < ActionDispatch::IntegrationTest
  test 'returns api version number' do
    get '/api', {},
        { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    data = json(response.body)
    assert_match 'v1', data[:api_version]
  end

  test 'returns links to available APIs' do
    get '/api', {},
        { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    data = json(response.body)
    assert_match api_legislations_url, data[:legislations]
  end
end