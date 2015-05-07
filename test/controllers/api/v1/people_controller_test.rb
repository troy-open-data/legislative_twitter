require 'test_helper'

module API
  module V1
    class PeopleControllerTest < ActionController::TestCase
      context 'People API views' do
        context 'GET #index' do
          setup { get :index, { format: :json } }
          should respond_with(:success)
          # assert_not_nil assigns(:people), '@people not set'
          should allow_requests_from_origin('*')
        end

        context 'GET #show' do
          setup do
            @person = create(:person)
            get :show, { id: @person, format: :json }
          end
          should respond_with(:success)
          should allow_requests_from_origin('*')
        end
      end
    end
  end
end
