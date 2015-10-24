require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  context 'people' do
    context '#index' do
      should 'get index' do
        get :index
        assert_response :success
        assert_not_nil assigns(:people)
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
          assert_redirected_to new_user_session_path
        end
      end
    end

    context '#create' do
      context 'as admin' do
        should 'create person' do
          sign_in @admin

          assert_difference('Person.count') do
            post :create, person: attributes_for(:person)
          end
          assert_redirected_to person_path(assigns(:person))
        end

        should 'not create with invalid parameters' do
          sign_in @admin

          invalid_attributes = attributes_for(:person, first: nil)
          assert_no_difference('Person.count') do
            post :create, person: invalid_attributes
          end
          refute_equal :redirect, response.status
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :create, person: {}
          assert_redirected_to new_user_session_path
        end
      end
    end
  end

  context 'a person' do
    setup do
      @person = create(:person)
    end

    context '#show' do
      should 'show' do
        get :show, id: @person, format: :html
        assert_response :success
      end
    end

    context '#edit' do
      context 'as admin' do
        should 'get edit' do
          sign_in @admin
          get :edit, id: @person
          assert_response :success
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :edit, id: @person
          assert_redirected_to new_user_session_path
        end
      end
    end

    context '#update' do
      context 'as admin' do
        should 'patch update' do
          sign_in @admin

          patch :update, id: @person, person: attributes_for(:person)
          assert_redirected_to person_path(assigns(:person))
        end

        should 'not update with invalid parameters' do
          sign_in @admin

          invalid_attributes = { first: nil }
          patch :update, id: @person, person: invalid_attributes

          refute_equal invalid_attributes[:first], @person.first
          refute_equal :redirect, response.status
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          get :update, id: @person, person: {}
          assert_redirected_to new_user_session_path
        end
      end
    end

    context '#destroy' do
      context 'as admin' do
        should 'be destroyed' do
          sign_in @admin

          assert_difference('Person.count', -1) do
            delete :destroy, id: @person
          end

          assert_redirected_to people_path
        end
      end
      context 'not as admin' do
        should 'redirect to login' do
          delete :destroy, id: @person
          assert_redirected_to new_user_session_path
        end
      end
    end
  end
end
