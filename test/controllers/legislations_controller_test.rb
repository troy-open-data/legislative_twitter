require 'test_helper'

class LegislationsControllerTest < ActionController::TestCase
  setup do
    @legislation = create(:legislation)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:legislations)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create legislation' do
    assert_difference('Legislation.count') do
      post :create, legislation: attributes_for(:legislation)
    end

    assert_redirected_to legislation_path(assigns(:legislation))
  end

  test 'should show legislation' do
    %w{html pdf json}.each do |format|
      get :show, id: @legislation, format: format
      assert_response :success
    end
  end

  test 'should get edit' do
    get :edit, id: @legislation
    assert_response :success
  end

  test 'should update legislation' do
    patch :update, id: @legislation, legislation: attributes_for(:legislation)
    assert_redirected_to legislation_path(assigns(:legislation))
  end

  test 'should destroy legislation' do
    assert_difference('Legislation.count', -1) do
      delete :destroy, id: @legislation
    end

    assert_redirected_to legislations_path
  end
end
