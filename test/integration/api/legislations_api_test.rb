require 'test_helper'

class LegislationsApiTest < ActionDispatch::IntegrationTest
  setup do
    @legislation = create(:legislation)
  end

  test 'returns list of all legislation' do
    get '/api/legislations'

    assert_response :success
    assert_equal Mime::JSON, response.content_type
  end

  test 'returns legislation filtered by type' do
    type = @legislation.legislation_type

    get "/api/legislations?type=#{type}"

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    legislations = json(response.body)
    types = legislations.collect{|l| l[:legislation_type]}.uniq

    assert_equal 1, types.length
    assert_equal type, types[0]
  end

  test 'returns legislation by id' do
    get "/api/legislations/#{@legislation.id}"
    assert_response :success
    assert_equal Mime::JSON, response.content_type

    legislation = json(response.body)
    assert_equal @legislation.id, legislation[:id]
  end
end
