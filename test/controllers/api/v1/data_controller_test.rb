require 'test_helper'

module API::V1
  class DataControllerTest < ActionController::TestCase
    test 'should get data' do
      get :index, { format: :json },
          { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

      assert_response :success
    end
  end
end