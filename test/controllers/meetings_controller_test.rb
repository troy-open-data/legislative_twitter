require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  setup do
    @meeting = create(:meeting)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:meetings)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create meeting' do
    assert_difference('Meeting.count') do
      post :create, meeting: { date_and_time:   @meeting.date_and_time,
                               organization_id: @meeting.organization_id }
    end

    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test 'should show meeting' do
    get :show, id: @meeting
    assert_response :success
  end

  test 'should show agenda' do
    %w{html pdf}.each do |format|
      get :agenda, id: @meeting, format: format
      assert_response :success
    end
  end

  test 'should show minutes' do
    %w{html pdf}.each do |format|
      get :minutes, id: @meeting, format: format
      assert_response :success
    end
  end

  test 'should start meeting' do
    get :start_meeting, id: @meeting
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @meeting
    assert_response :success
  end

  test 'should toggle agenda' do
    xhr :get, :toggle_agenda, id: @meeting, format: 'js'
    assert_response :success
  end

  test 'should toggle minutes' do
    xhr :get, :toggle_minutes, id: @meeting, format: 'js'
    assert_response :success
  end

  test 'should update meeting' do
    patch :update, id: @meeting, meeting: { date_and_time:    @meeting.date,
                                            organization_id:  @meeting.organization_id }
    assert_redirected_to meeting_path(assigns(:meeting))
  end

  test 'should destroy meeting' do
    assert_difference('Meeting.count', -1) do
      delete :destroy, id: @meeting
    end

    assert_redirected_to meetings_path
  end
end
