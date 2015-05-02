require 'test_helper'

module API
  module V1
    class OrganizationsControllerTest < ActionController::TestCase
      context 'Organizations API endpoints' do
        should route(:get, '/api/v1/organizations').to(action: :index, format: :json)
        should route(:get, '/api/v1/organizations/1')
                   .to(action: :show, id: 1, format: :json)
      end

      context 'Organizations API views' do
        context 'GET #index' do
          setup { get :index, { format: :json } }
          should respond_with(:success)
          # assert_not_nil assigns(:organizations), '@organizations not set'
        end

        context 'GET #show' do
          setup do
            @organization = create(:organization)
            get :show, { id: @organization, format: :json }
          end
          should respond_with(:success)
        end
      end
    end
  end
end
