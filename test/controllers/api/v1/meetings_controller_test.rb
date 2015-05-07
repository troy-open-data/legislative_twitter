require 'test_helper'

module API
  module V1
    class MeetingsControllerTest < ActionController::TestCase
      context 'Meetings API endpoints' do
        should route(:get, '/api/meetings').to(action: :index, format: :json)
        should route(:get, '/api/meetings/1')
                   .to(action: :show, id: 1, format: :json)
      end

      context 'Meetings API views' do
        setup { @v1 = { 'Accept:'=>'application/vnd.troycitycouncil.v1+json' } }

        context 'GET #index' do
          setup { get :index, { format: :json }, @v1 }
          should respond_with(:success)
          # assert_not_nil assigns(:meetings), '@meetings not set'
          should allow_requests_from_origin('*')
        end

        context 'GET #show' do
          setup do
            @meeting = create(:meeting)
            get :show, { id: @meeting, format: :json }, @v1
          end
          should respond_with(:success)
          should allow_requests_from_origin('*')
        end
      end
    end
  end
end
