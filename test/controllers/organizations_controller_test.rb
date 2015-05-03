require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  context 'organizations' do
    context '#index' do
      should 'get index' do
        get :index
        assert_response :success
        assert_not_nil assigns(:organizations)
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
        should 'create organization' do
          sign_in @admin

          assert_difference('Organization.count') do
            post :create, organization: attributes_for(:organization)
          end
          assert_redirected_to organization_path(assigns(:organization))
        end

        should 'not create with invalid parameters' do
          sign_in @admin
          invalid_attributes = { name: nil, level: nil }
          assert_no_difference('Organization.count') do
            post :create, organization: invalid_attributes
          end
          refute_equal :redirect, response.status
        end
      end
    end
    context 'not as admin' do
      should 'redirect to login' do
        post :create, organization: {}
        assert_redirected_to new_admin_session_path
      end
    end
  end


  context 'an organization' do
    setup do
      @organization = create(:organization)
    end

    context '#show' do
      should 'show' do
        get :show, id: @organization
        assert_response :success
      end
    end

    context '#edit' do
      context 'as admin' do
        should 'get edit' do
          sign_in @admin

          get :edit, id: @organization
          assert_response :success
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :edit, id: @organization
          assert_redirected_to new_admin_session_path
        end
      end
    end

    context '#update' do
      context 'as admin' do
        should 'patch update' do
          sign_in @admin

          valid_attributes = { name: 'New Name' }
          patch :update, id: @organization, organization: valid_attributes
          assert_redirected_to organization_path(assigns(:organization))
        end

        should 'not update with invalid parameters' do
          sign_in @admin
          invalid_attributes = { name: nil }
          patch :update, id: @organization, organization: invalid_attributes

          refute_equal invalid_attributes[:name], @organization.name
          refute_equal :redirect, response.status
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          patch :update, id: @organization, organization: {}
          assert_redirected_to new_admin_session_path
        end
      end
    end

    context '#destroy' do
      context 'as admin' do
        should 'temporarily be not destroyed' do
          sign_in @admin
          assert_no_difference('Organization.count', -1) do
            delete :destroy, id: @organization
          end
          assert_redirected_to root_url

          # assert_redirected_to organizations_path
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          delete :destroy, id: @organization
          assert_redirected_to new_admin_session_path
        end
      end
    end
  end
end
