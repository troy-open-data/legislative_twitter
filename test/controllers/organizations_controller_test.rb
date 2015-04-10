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

    should 'not create with invalid parameters' do
      invalid_attributes = { name: nil, level: nil }
      assert_no_difference('Organization.count') do
        post :create, organization: invalid_attributes
      end
      refute_equal :redirect, response.status
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
      valid_attributes = { name: 'New Name' }
      patch :update, id: @organization, organization: valid_attributes
      assert_redirected_to organization_path(assigns(:organization))
    end

    should 'not update with invalid parameters' do
      invalid_attributes = { name: nil }
      patch :update, id: @organization, organization: invalid_attributes

      refute invalid_attributes[:name], @organization.name
      refute_equal :redirect, response.status
    end

    should 'be destroyed' do
      assert_difference('Organization.count', -1) do
        delete :destroy, id: @organization
      end
      assert_redirected_to organizations_path
    end
  end
end
