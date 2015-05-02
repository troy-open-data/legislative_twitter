require 'test_helper'

class VersionsControllerTest < ActionController::TestCase
  should route(:post, '/versions/1/revert').to(action: :revert, id: 1)

  setup do
    @bill = create(:bill)
    request.env['HTTP_REFERER'] = bills_path
  end

  context '#revert' do
    context 'as an admin' do
      context 'A previous version of an object' do
        setup do
          @bill.update(title: 'New Title')
          @bill.save!

          @most_recent = @bill.versions.last
        end
        should 'revert the parent object to that version' do
          sign_in @admin

          post :revert, id: @most_recent
          assert_redirected_to bill_path(@bill)
        end
      end
      context 'An invalid version' do
        should 'raise an error when trying to revert' do
          sign_in @admin

          assert_raise(StandardError) do
            post :revert, id: @bill.versions.last.id
          end
        end
      end
    end

    context 'not as an admin' do
      should 'return unauthorized status' do
        post :revert, id: @bill.versions.last.id
        assert_redirected_to new_admin_session_path
      end
    end
  end
end
