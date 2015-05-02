require 'test_helper'

module API
  module V1
    class BillsControllerTest < ActionController::TestCase
      context 'Bills API endpoints' do
        should route(:get, '/api/bills').to(action: :index, format: :json)
        should route(:get, '/api/bills/1')
               .to(action: :show, id: 1, format: :json)
      end

      context 'Bills API views' do
        setup { @v1 = { 'Accept:'=>'application/vnd.troycitycouncil.v1+json' } }

        context 'GET #index' do
          setup { get :index, { format: :json }, @v1 }
          should respond_with(:success)
          # assert_not_nil assigns(:bills), '@bills not set'
          # TODO: test for types?
        end

        context 'GET #show' do
          setup do
            @bill = create(:bill)
            get :show, { id: @bill, format: :json }, @v1
          end
          should respond_with(:success)
        end
      end
    end
  end
end
