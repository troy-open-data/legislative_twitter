require 'test_helper'

module API
  module V1
    class OrganizationsControllerTest < ActionController::TestCase
      setup do
        @headers = { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }
      end

      context 'Organizations API' do
        context 'organizations' do
          should 'get index' do
            get :index, { format: :json }, @headers

            assert_response :success
            assert_not_nil assigns(:organizations), '@organizations not set'
          end
        end

        context 'organization' do
          setup do
            @organization = create(:organization)
          end
          should 'show' do
            get :show, { id: @organization, format: :json }, @headers

            assert_response :success
          end
        end
      end
    end
  end
end
