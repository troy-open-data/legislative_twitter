require 'test_helper'

module API
  module V1
    class PeopleControllerTest < ActionController::TestCase
      context 'People API endpoints' do
        should route(:get, '/api/v1/people').to(action: :index, format: :json)
        should route(:get, '/api/v1/people/1')
                   .to(action: :show, id: 1, format: :json)
      end

      context 'People API views' do
        context 'GET #index' do
          setup { get :index, { format: :json } }
          should respond_with(:success)
          # assert_not_nil assigns(:people), '@people not set'
        end

        context 'GET #show' do
          setup do
            @person = create(:person)
            get :show, { id: @person, format: :json }
          end
          should respond_with(:success)
        end
      end
    end
  end
end
