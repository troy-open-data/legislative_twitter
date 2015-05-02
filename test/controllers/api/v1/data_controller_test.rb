require 'test_helper'

module API
  module V1
    class DataControllerTest < ActionController::TestCase
      context 'Data API endpoint' do
        should route(:get, '/api').to(action: :index, format: :json)
      end

      context 'Data API view' do
        setup do
          @headers = { 'Accept:'=>'application/vnd.troycitycouncil.v1+json' }
        end
        context 'GET #index' do
          setup { get :index, { format: :json }, @headers }
          should respond_with(:success)
        end
      end
    end
  end
end
