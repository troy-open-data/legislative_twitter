require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  context 'search' do
    context '#index' do
      should 'get results' do
        get :index, search: 'query'
        assert_response :success
      end
    end
  end
end
