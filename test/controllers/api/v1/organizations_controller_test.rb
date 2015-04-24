require 'test_helper'

module API::V1
  class OrganizationsControllerTest < ActionController::TestCase
    context 'Organizations API' do
      context 'organizations' do
        should 'get index' do
          get :index, { format: :json },
              { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

          assert_response :success
          assert_not_nil assigns(:organizations), '@organizations not set'
        end
      end

      context 'organization' do
        setup do
          @organization = create(:organization)
        end
        should 'show' do
          get :show, { id: @organization, format: :json },
              { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

          assert_response :success
        end
      end
    end
  end
end
