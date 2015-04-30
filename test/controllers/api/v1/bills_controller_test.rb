require 'test_helper'

module API::V1
  class BillsControllerTest < ActionController::TestCase
    context 'bills API' do
      context 'bills' do
        should 'get index' do
          get :index, { format: :json },
              { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

          assert_response :success
          assert_not_nil assigns(:bills), '@bills not set'
        end
      end

      context 'bill' do
        setup do
          @bill = create(:bill)
        end
        should 'show' do
          get :show, { id: @bill, format: :json },
              { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

          assert_response :success
        end
      end
    end
  end
end

