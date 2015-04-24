require 'test_helper'

class BillsControllerTest < ActionController::TestCase
  context 'bill' do
    should 'get index' do
      get :index
      assert_response :success
      assert_not_nil assigns(:bills)
    end

    should 'get new' do
      get :new
      assert_response :success
    end

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

  context 'A piece of bill' do
    setup do
      @bill = create(:bill)
    end

    should 'show in html' do
      get :show, id: @bill, format: :html
      assert_response :success
    end

    should 'show in pdf' do
      get :show, id: @bill, format: :pdf
      assert_response :success
    end

    should 'get edit' do
      get :edit, id: @bill
      assert_response :success
    end

    should 'patch update' do
      patch :update, id: @bill, bill: attributes_for(:bill)
      assert_redirected_to bill_path(assigns(:bill))
    end

    should 'not update with invalid parameters' do
      invalid_attributes = { title: nil }
      patch :update, id: @bill, bill: invalid_attributes

      refute_equal invalid_attributes[:title], @bill.title
      refute_equal :redirect, response.status
    end

    should 'be destroyed' do
      assert_difference('Bill.count', -1) do
        delete :destroy, id: @bill
      end

      assert_redirected_to bills_path
    end
  end
end
