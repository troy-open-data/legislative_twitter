require 'test_helper'

module API::V1
  class MeetingsControllerTest < ActionController::TestCase
    setup do
      @meeting = create(:meeting)
    end

    test 'should get index' do
      get :index, { format: :json },
          { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

      assert_response :success
      assert_not_nil assigns(:meetings), '@meetings not set'
    end

    test 'should show meeting' do
      get :show, { id: @meeting, format: :json },
          { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

      assert_response :success
    end
  end
end