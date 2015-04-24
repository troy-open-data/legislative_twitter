require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  context 'meetings' do
    should 'get index' do
      get :index
      assert_response :success
      assert_not_nil assigns(:meetings)
    end

    should 'get new' do
      get :new
      assert_response :success
    end

    should 'create meeting' do
      @meeting = create(:meeting)
      meeting_params = attributes_for(:meeting, organization_id: @meeting.organization_id)
      assert_difference('Meeting.count') do
        post :create, meeting: meeting_params
      end
      assert_redirected_to meeting_path(assigns(:meeting))
    end

    should 'not create with invalid parameters' do
      invalid_attributes = attributes_for(:meeting, organization_id: nil)
      assert_no_difference('Meeting.count') do
        post :create, meeting: invalid_attributes
      end
      refute_equal :redirect, response.status
    end
  end


  context 'a meeting' do
    setup do
      @meeting = create(:meeting)
    end

    should 'show' do
      get :show, id: @meeting
      assert_response :success
    end

    should 'start' do
      get :start_meeting, id: @meeting
      assert_response :success
    end

    should 'get edit' do
      get :edit, id: @meeting
      assert_response :success
    end

    should 'patch update' do
      patch :update, id: @meeting, meeting: { date_and_time:    @meeting.date,
                                              organization_id:  @meeting.organization_id }
      assert_redirected_to meeting_path(assigns(:meeting))
    end

    should 'not update with invalid parameters' do
      invalid_attributes = { organization_id: nil }
      patch :update, id: @meeting, meeting: invalid_attributes

      refute_equal invalid_attributes[:organization_id], @meeting.organization_id
      refute_equal :redirect, response.status
    end

    should 'be destroyed' do
      assert_difference('Meeting.count', -1) do
        delete :destroy, id: @meeting
      end

      assert_redirected_to meetings_path
    end

    context 'agenda' do
      should 'show in html' do
        get :agenda, { id: @meeting, format: :html }
        assert_response :success
      end

      should 'show in pdf' do
        get :agenda, { id: @meeting, format: :pdf }
        assert_response :success
      end

      should 'toggle approval' do
        xhr :get, :toggle_agenda, id: @meeting, format: 'js'
        assert_response :success
      end
    end

    context 'minutes' do
      should 'show in html' do
        get :minutes, { id: @meeting, format: :html }
        assert_response :success
      end

      should 'show in pdf' do
        get :minutes, { id: @meeting, format: :pdf }
        assert_response :success
      end

      should 'toggle approval' do
        xhr :get, :toggle_minutes, id: @meeting, format: 'js'
        assert_response :success
      end
    end
  end
end