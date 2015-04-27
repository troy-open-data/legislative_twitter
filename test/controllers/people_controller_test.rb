require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  context 'people' do
    should 'get index' do
      get :index
      assert_response :success
      assert_not_nil assigns(:people)
    end

    should 'get new' do
      get :new
      assert_response :success
    end

    should 'create person' do
      assert_difference('Person.count') do
        post :create, person: attributes_for(:person)
      end
      assert_redirected_to person_path(assigns(:person))
    end

    should 'not create with invalid parameters' do
      invalid_attributes = attributes_for(:person, first: nil)
      assert_no_difference('Person.count') do
        post :create, person: invalid_attributes
      end
      refute_equal :redirect, response.status
    end
  end

  context 'a person' do
    setup do
      @person = create(:person)
    end

    should 'show' do
      get :show, id: @person, format: :html
      assert_response :success
    end

    should 'get edit' do
      get :edit, id: @person
      assert_response :success
    end

    should 'patch update' do
      patch :update, id: @person, person: attributes_for(:person)
      assert_redirected_to person_path(assigns(:person))
    end

    should 'not update with invalid parameters' do
      invalid_attributes = { first: nil }
      patch :update, id: @person, person: invalid_attributes

      refute_equal invalid_attributes[:first], @person.first
      refute_equal :redirect, response.status
    end

    should 'be destroyed' do
      assert_difference('Person.count', -1) do
        delete :destroy, id: @person
      end

      assert_redirected_to people_path
    end
  end
end
