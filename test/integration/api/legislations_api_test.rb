require 'test_helper'

class LegislationsApiTest < ActionDispatch::IntegrationTest
  setup do
    @bill = create(:bill)
  end

  test 'returns list of all bill' do
    get '/api/bills', {},
        { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

    assert_response :success
    assert_equal Mime::JSON, response.content_type
  end

  test 'list of bill includes bill urls' do
    get '/api/bills', {},
        { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

    assert_response :success

    bill_data = json(response.body)[0]
    assert_equal api_bill_url(bill_data[:id], format: :json),
                 bill_data[:url]
  end

  test 'returns bill filtered by type' do
    type = @bill.legislation_type

    get "/api/bills?type=#{type}", {},
        { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    bills = json(response.body)
    types = bills.collect{|l| l[:legislation_type]}.uniq

    assert_equal 1, types.length
    assert_equal type, types[0]
  end

  test 'returns bill by id' do
    get "/api/bills/#{@bill.id}", {},
        { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

    assert_response :success
    assert_equal Mime::JSON, response.content_type

    bill = json(response.body)
    assert_equal @bill.id, bill[:id]
  end
end
