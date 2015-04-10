require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  context 'Searching' do
    should 'get results' do
      get :index, search: 'query'
      assert_response :success
    end
  end
end
