require 'test_helper'

module API
  module V1
    class PeopleControllerTest < ActionController::TestCase
      context 'People API endpoints' do
        should route(:get, '/api/people').to(action: :index, format: :json)
        should route(:get, '/api/people/1')
                   .to(action: :show, id: 1, format: :json)
      end

      context 'People API views' do
        setup { @v1 = { 'Accept:'=>'application/vnd.troycitycouncil.v1+json' } }

        context 'GET #index' do
          setup { get :index, { format: :json }, @v1 }
          should respond_with(:success)
          # assert_not_nil assigns(:people), '@people not set'
          should allow_requests_from_origin('*')
        end

        context 'GET #show' do
          setup do
            @person = create(:person)
            get :show, { id: @person, format: :json }, @v1
          end
          should respond_with(:success)
          should allow_requests_from_origin('*')
        end
      end
    end
  end
end
