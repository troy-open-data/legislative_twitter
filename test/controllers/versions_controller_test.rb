require 'test_helper'

class VersionsControllerTest < ActionController::TestCase
  setup do
    @bill = create(:bill)
    request.env['HTTP_REFERER'] = bills_path
  end

  context 'A previous version of an object' do
    setup do
      @bill.update(body: 'New Body')
      @bill.save!

      @most_recent = @bill.versions.last
    end

    should 'revert the parent object to that version' do
      post :revert, id: @most_recent
      assert_redirected_to bill_path(@bill)
    end
  end

  context 'An invalid version' do
    should 'raise an error when trying to revert' do
      assert_raise(StandardError) do
        post :revert, id: @bill.versions.last.id
      end
    end
  end
end
