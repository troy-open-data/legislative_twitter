require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  # Rendering by role (guest, admin)
  context 'as a guest' do
    context 'GET #index' do
      setup { get :index }
      should respond_with(:success)
      should_not allow_requests_from_origin('*')
    end
    context 'GET #new' do
      setup { get :new }
      should redirect_to(action: 'new', controller: 'devise/sessions')
    end
    context 'POST #create' do
      setup { post :create, bill: {} }
      should redirect_to(action: 'new', controller: 'devise/sessions')
    end

    context 'when a bill exists' do
      setup { @bill = create(:bill) }

      context 'GET #show' do
        context 'html' do
          setup { get :show, id: @bill, format: :html }
          should respond_with(:success)
        end
        context 'html' do
          setup { get :show, id: @bill, format: :pdf }
          should respond_with(:success)
        end
      end

      context 'GET #edit' do
        setup { get :edit, id: @bill }
        should redirect_to(action: 'new', controller: 'devise/sessions')
      end
      context 'PATCH #update' do
        setup { patch :update, id: @bill, bill: {} }
        should redirect_to(action: 'new', controller: 'devise/sessions')
      end
      context 'DELETE #destroy' do
        setup { delete :destroy, id: @bill }
        should redirect_to(action: 'new', controller: 'devise/sessions')
      end
    end
  end

  context 'as an admin' do
    setup { sign_in @admin }

    context 'GET #new' do
      setup { get :new }
      should respond_with(:success)
    end
    context 'POST #create' do
      should 'create bill' do
        assert_difference('Bill.count') do
          post :create, bill: attributes_for(:bill)
        end
        assert_redirected_to bill_path(assigns(:bill))
      end

      should 'not create with invalid parameters' do
        invalid_attributes = attributes_for(:bill, title: nil)
        assert_no_difference('Bill.count') do
          post :create, bill: invalid_attributes
        end
        refute_equal :redirect, response.status
      end
    end

    context 'when a bill exists' do
      setup { @bill = create(:bill) }
      context 'GET #edit' do
        setup { get :edit, id: @bill }
        should respond_with(:success)
      end
      context 'PATCH #update' do
        context 'with valid parameters' do
          setup { patch :update, id: @bill, bill: attributes_for(:bill) }
          should 'redirect to bill path' do
            assert_redirected_to bill_path(assigns(:bill))
          end
        end
        context 'with invalid parameters' do
          setup { patch :update, id: @bill, bill: { title: nil } }
          should 'not update' do
            refute_equal nil, @bill.title
            refute_equal :redirect, response.status
          end
        end
      end
      context 'DELETE #destroy' do
        should 'temporarily not destroy bill' do
          assert_no_difference('Bill.count', -1) do
            delete :destroy, id: @bill
          end
          assert_redirected_to root_path

          # assert_redirected_to bills_path
        end
      end
    end
  end
end
