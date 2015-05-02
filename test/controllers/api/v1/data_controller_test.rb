require 'test_helper'

module API
  module V1
    class DataControllerTest < ActionController::TestCase
      context 'Data API view' do
        context 'GET #index' do
          setup { get :index, { format: :json }, @headers }
          should respond_with(:success)
        end
      end
    end
  end
end
