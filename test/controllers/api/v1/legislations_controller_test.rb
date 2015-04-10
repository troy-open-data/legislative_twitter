require 'test_helper'

module API::V1
  class LegislationsControllerTest < ActionController::TestCase
    setup do
      @legislation = create(:legislation)
    end

    test 'should get index' do
      get :index, { format: :json },
          { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

      assert_response :success
      assert_not_nil assigns(:legislations), '@legislations not set'
    end

    test 'should show legislation' do
      get :show, { id: @legislation, format: :json },
          { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

      assert_response :success
    end
  end
end

