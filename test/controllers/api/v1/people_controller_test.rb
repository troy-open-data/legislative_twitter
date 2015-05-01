require 'test_helper'

module API
  module V1
    class PeopleControllerTest < ActionController::TestCase
      context 'People API' do
        setup do
          @headers = { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }
        end

        context 'people' do
          should 'get index' do
            get :index, { format: :json }, @headers

            assert_response :success
            assert_not_nil assigns(:people), '@people not set'
          end
        end

        context 'people' do
          setup do
            @people = create(:person)
          end
          should 'show' do
            get :show, { id: @people, format: :json }, @headers

            assert_response :success
          end
        end
      end
    end
  end
end
