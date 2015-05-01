require 'test_helper'

class AgendaControllerTest < ActionController::TestCase
  context 'agenda' do
    setup { @meeting = create(:meeting) }
    context '#show' do
      should 'show in html' do
        get :show, { id: @meeting, format: :html }
        assert_response :success
      end

      should 'show in pdf' do
        get :show, { id: @meeting, format: :pdf }
        assert_response :success
      end
    end

    context '#edit' do
      context 'as admin' do
        should 'toggle approval' do
          sign_in @admin

          xhr :get, :edit, id: @meeting, format: 'js'
          assert_response :success
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          xhr :get, :edit, id: @meeting, format: 'js'
          assert_response :unauthorized
        end
      end
    end
  end

end
