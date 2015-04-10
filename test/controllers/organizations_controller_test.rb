require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  context 'Organizations' do
    should 'get index' do
      get :index
      assert_response :success
      assert_not_nil assigns(:organizations)
    end

    should 'get new' do
      get :new
      assert_response :success
    end

    should 'create organization' do
      assert_difference('Organization.count') do
        post :create, organization: attributes_for(:organization)
      end
      assert_redirected_to organization_path(assigns(:organization))
    end
  end

  context 'An organization' do
    setup do
      @organization = create(:organization)
    end

    should 'show' do
      get :show, id: @organization
      assert_response :success
    end

    should 'get edit' do
      get :edit, id: @organization
      assert_response :success
    end

    should 'patch update' do
      patch :update, id: @organization, organization: attributes_for(:organization)
      assert_redirected_to organization_path(assigns(:organization))
    end

    should 'be destroyed' do
      assert_difference('Organization.count', -1) do
        delete :destroy, id: @organization
      end
      assert_redirected_to organizations_path
    end
  end
end
