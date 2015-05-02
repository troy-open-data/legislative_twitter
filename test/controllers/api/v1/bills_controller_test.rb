require 'test_helper'

module API
  module V1
    class BillsControllerTest < ActionController::TestCase
      context 'Bills API views' do
        context 'GET #index' do
          setup { get :index, { format: :json } }
          should respond_with(:success)
          # assert_not_nil assigns(:bills), '@bills not set'
          # TODO: test for types?
        end

        context 'GET #show' do
          setup do
            @bill = create(:bill)
            get :show, { id: @bill, format: :json }
          end
          should respond_with(:success)
        end
      end
    end
  end
end
