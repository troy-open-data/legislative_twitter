require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test 'should get search' do
    get :search, search: 'search'
    assert_response :success
  end
end
