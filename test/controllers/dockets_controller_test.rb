require 'test_helper'

class DocketsControllerTest < ActionController::TestCase
  setup do
    @docket = dockets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dockets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create docket" do
    assert_difference('Docket.count') do
      post :create, docket: { meeting_id: @docket.meeting_id }
    end

    assert_redirected_to docket_path(assigns(:docket))
  end

  test "should show docket" do
    get :show, id: @docket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @docket
    assert_response :success
  end

  test "should update docket" do
    patch :update, id: @docket, docket: { meeting_id: @docket.meeting_id }
    assert_redirected_to docket_path(assigns(:docket))
  end

  test "should destroy docket" do
    assert_difference('Docket.count', -1) do
      delete :destroy, id: @docket
    end

    assert_redirected_to dockets_path
  end
end
