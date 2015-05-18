require 'test_helper'

class MinutesControllerTest < ActionController::TestCase
  should route(:get, '/meetings/1/minutes').to(action: :show, id: 1)
  should route(:get, '/meetings/1/minutes/toggle')
         .to(action: :edit, id: 1)

  context 'a meeting agenda' do
    setup { @meeting = create(:meeting) }

    context 'as an admin' do
      setup { sign_in @admin }
      context 'GET #edit' do
        setup { xhr :get, :edit, id: @meeting, format: :js }
        should respond_with(:success)
      end
    end

    context 'as a guest' do
      context 'GET #show' do
        context 'in html' do
          setup { get :show, id: @meeting, format: :html }
          should respond_with(:success)
        end
        context 'in pdf' do
          setup { get :show, id: @meeting, format: :pdf }
          should respond_with(:success)
        end
      end

      context 'GET #edit' do
        setup { xhr :get, :edit, id: @meeting, format: :js }
        should respond_with(:unauthorized)
      end
    end
  end
end
