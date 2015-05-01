require 'test_helper'

class MeetingsControllerTest < ActionController::TestCase
  context 'meetings' do
    context '#index' do
      should 'get index' do
        get :index
        assert_response :success
        assert_not_nil assigns(:meetings)
      end
    end

    context '#new' do
      context 'as admin' do
        should 'get new' do
          sign_in @admin

          get :new
          assert_response :success
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :new
          assert_redirected_to new_admin_session_path
        end
      end
    end

    context '#create' do
      context 'as admin' do
        should 'create meeting' do
          sign_in @admin

          @meeting = create(:meeting)
          meeting_params = attributes_for(:meeting, organization_id: @meeting.organization_id)
          assert_difference('Meeting.count') do
            post :create, meeting: meeting_params
          end
          assert_redirected_to meeting_path(assigns(:meeting))
        end
        should 'not create with invalid parameters' do
          sign_in @admin

          invalid_attributes = attributes_for(:meeting, organization_id: nil)
          assert_no_difference('Meeting.count') do
            post :create, meeting: invalid_attributes
          end
          refute_equal :redirect, response.status
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :create, meeting: {}
          assert_redirected_to new_admin_session_path
        end
      end
    end
  end


  context 'a meeting' do
    setup do
      @meeting = create(:meeting)
    end

    context '#show' do
      should 'show' do
        get :show, id: @meeting
        assert_response :success
      end
    end

    context '#start_meeting' do
      context 'as admin' do
        should 'start' do
          sign_in @admin

          get :start_meeting, id: @meeting
          assert_response :success
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :start_meeting, id: @meeting
          assert_redirected_to new_admin_session_path
        end
      end
    end

    context '#edit' do
      context 'as admin' do
        should 'get edit' do
          sign_in @admin

          get :edit, id: @meeting
          assert_response :success
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :edit, id: @meeting
          assert_redirected_to new_admin_session_path
        end
      end
    end

    context '#update' do
      context 'as admin' do
        should 'patch update' do
          sign_in @admin

          patch :update, id: @meeting, meeting: { date_and_time:    @meeting.date,
                                                  organization_id:  @meeting.organization_id }
          assert_redirected_to meeting_path(assigns(:meeting))
        end

        should 'not update with invalid parameters' do
          sign_in @admin

          invalid_attributes = { organization_id: nil }
          patch :update, id: @meeting, meeting: invalid_attributes

          refute_equal invalid_attributes[:organization_id], @meeting.organization_id
          refute_equal :redirect, response.status
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          patch :update, id: @meeting, meeting: {}
          assert_redirected_to new_admin_session_path
        end
      end
    end

    context '#destroy' do
      context 'as admin' do
        should 'be destroyed' do
          sign_in @admin

          assert_difference('Meeting.count', -1) do
            delete :destroy, id: @meeting
          end

          assert_redirected_to meetings_path
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          delete :destroy, id: @meeting
          assert_redirected_to new_admin_session_path
        end
      end
    end
  end
end