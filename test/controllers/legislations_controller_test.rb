require 'test_helper'

class LegislationsControllerTest < ActionController::TestCase
  context 'Legislation' do
    should 'get index' do
      get :index
      assert_response :success
      assert_not_nil assigns(:legislations)
    end

    should 'get new' do
      get :new
      assert_response :success
    end

    should 'create legislation' do
      assert_difference('Legislation.count') do
        post :create, legislation: attributes_for(:legislation)
      end

      assert_redirected_to legislation_path(assigns(:legislation))
    end
  end

  context 'A piece of legislation' do
    setup do
      @legislation = create(:legislation)
    end

    should 'show in html' do
      get :show, id: @legislation, format: :html
      assert_response :success
    end

    should 'show in pdf' do
      get :show, id: @legislation, format: :pdf
      assert_response :success
    end

    should 'get edit' do
      get :edit, id: @legislation
      assert_response :success
    end

    should 'patch update' do
      patch :update, id: @legislation, legislation: attributes_for(:legislation)
      assert_redirected_to legislation_path(assigns(:legislation))
    end

    should 'be destroyed' do
      assert_difference('Legislation.count', -1) do
        delete :destroy, id: @legislation
      end

      assert_redirected_to legislations_path
    end
  end
end
