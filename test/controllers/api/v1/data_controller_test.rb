require 'test_helper'

module API
  module V1
    class DataControllerTest < ActionController::TestCase
      context 'API data' do
        should 'get API data index' do
          get :index, { format: :json },
              'Accept:' => 'application/vnd.troycitycouncil.v1+json'

          assert_response :success
        end
      end
    end
  end
end
