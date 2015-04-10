require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  context 'Statuses' do
    should 'get index' do
      get :index
      assert_response :success
      assert_not_nil assigns(:statuses)
    end

    should 'get new' do
      get :new
      assert_response :success
    end

    should 'create status' do
      assert_difference('Status.count') do
        post :create, status: attributes_for(:status)
      end
      assert_redirected_to status_path(assigns(:status))
    end
  end

  context 'A Status' do
    setup do
      @status = create(:status)
    end

    should 'show' do
      get :show, id: @status
      assert_response :success
    end

    should 'get edit' do
      get :edit, id: @status
      assert_response :success
    end

    should 'patch update' do
      patch :update, id: @status, status: { title: @status.title }
      assert_redirected_to status_path(assigns(:status))
    end

    should 'be destroyed' do
      assert_difference('Status.count', -1) do
        delete :destroy, id: @status
      end
      assert_redirected_to statuses_path
    end
  end
end
