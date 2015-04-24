require 'test_helper'

module API::V1
  class MeetingsControllerTest < ActionController::TestCase

    context 'Meetings API' do
      context '/meetings' do
        should 'get index' do
          get :index, { format: :json },
              { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

          assert_response :success
          assert_not_nil assigns(:meetings), '@meetings not set'
        end
      end

      context '/meeting/:id' do
        setup do
          @meeting = create(:meeting)
        end

        should 'show' do
          get :show, { id: @meeting, format: :json },
              { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

          assert_response :success
        end

        context '/meeting/:id/agenda' do
          setup do
            @meeting = create(:meeting)
          end

          should 'show agenda' do
            get :agenda, { id: @meeting, format: :json },
                { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

            assert_response :success
          end
        end

        context '/meeting/:id/minutes' do
          setup do
            @meeting = create(:meeting)
          end

          should 'show minutes' do
            get :minutes, { id: @meeting, format: :json },
                { 'Accept:' => 'application/vnd.troycitycouncil.v1+json' }

            assert_response :success
          end
        end
      end
    end

  end
end