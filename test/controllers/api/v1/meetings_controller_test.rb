require 'test_helper'

module API
  module V1
    class MeetingsControllerTest < ActionController::TestCase
      context 'Meetings API endpoints' do
        should route(:get, '/api/v1/meetings').to(action: :index, format: :json)
        should route(:get, '/api/v1/meetings/1')
                   .to(action: :show, id: 1, format: :json)
      end

      context 'Meetings API views' do
        context 'GET #index' do
          setup { get :index, { format: :json } }
          should respond_with(:success)
          # assert_not_nil assigns(:meetings), '@meetings not set'
        end

        context 'GET #show' do
          setup do
            @meeting = create(:meeting)
            get :show, { id: @meeting, format: :json }
          end
          should respond_with(:success)
        end
      end
    end
  end
end
