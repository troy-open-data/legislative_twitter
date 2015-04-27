require 'test_helper'

module API::V1
  class PeopleControllerTest < ActionController::TestCase
    context 'People API' do
      context 'people' do
        should 'get index' do
          get :index, { format: :json },
              { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

          assert_response :success
          assert_not_nil assigns(:people), '@people not set'
        end
      end

      context 'people' do
        setup do
          @people = create(:person)
        end
        should 'show' do
          get :show, { id: @people, format: :json },
              { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

          assert_response :success
        end
      end
    end
  end
end
