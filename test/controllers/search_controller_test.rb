require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  should route(:get, '/search').to(action: :index)

  context 'search' do
    context '#index' do
      should 'get results' do
        get :index, search: 'query'
        assert_response :success
      end
    end
  end
end
