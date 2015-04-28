require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  context 'bills' do
    context '#index' do
      should 'get index' do
        get :index
        assert_response :success
        assert_not_nil assigns(:bills)
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
        should 'create bill' do
          sign_in @admin

          assert_difference('Bill.count') do
            post :create, bill: attributes_for(:bill)
          end
          assert_redirected_to bill_path(assigns(:bill))
        end

        should 'not create with invalid parameters' do
          sign_in @admin

          invalid_attributes = attributes_for(:bill, title: nil)
          assert_no_difference('Bill.count') do
            post :create, bill: invalid_attributes
          end
          refute_equal :redirect, response.status
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          post :create, bill: {}
          assert_redirected_to new_admin_session_path
        end
      end
    end

  end

  context 'a bill' do
    setup do
      @bill = create(:bill)
    end

    context '#show' do
      should 'show in html' do
        get :show, id: @bill, format: :html
        assert_response :success
      end

      should 'show in pdf' do
        get :show, id: @bill, format: :pdf
        assert_response :success
      end
    end

    context '#edit' do
      context 'as admin' do
        should 'get edit' do
          sign_in @admin

          get :edit, id: @bill
          assert_response :success
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :edit, id: @bill
          assert_redirected_to new_admin_session_path
        end
      end
    end

    context '#update' do
      context 'as admin' do
        should 'patch update' do
          sign_in @admin

          patch :update, id: @bill, bill: attributes_for(:bill)
          assert_redirected_to bill_path(assigns(:bill))
        end

        should 'not update with invalid parameters' do
          sign_in @admin

          invalid_attributes = { title: nil }
          patch :update, id: @bill, bill: invalid_attributes

          refute_equal invalid_attributes[:title], @bill.title
          refute_equal :redirect, response.status
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :update, id: @bill, bill: {}
          assert_redirected_to new_admin_session_path
        end
      end
    end

    context '#destroy' do
      context 'as admin' do
        should 'be destroyed' do
          sign_in @admin

          assert_difference('Bill.count', -1) do
            delete :destroy, id: @bill
          end

          assert_redirected_to bills_path
        end
      end
    end
    context 'not as admin' do
      should 'redirect to login' do
        get :destroy, id: @bill
        assert_redirected_to new_admin_session_path
      end
    end
  end
end
