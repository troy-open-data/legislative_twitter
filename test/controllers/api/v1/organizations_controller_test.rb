require 'test_helper'

module API
  module V1
    class OrganizationsControllerTest < ActionController::TestCase
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
