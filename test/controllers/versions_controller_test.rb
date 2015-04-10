require 'test_helper'

class VersionsControllerTest < ActionController::TestCase
  setup do
    @legislation = create(:legislation)
    request.env['HTTP_REFERER'] = legislations_path
  end

  context 'A previous version of an object' do
    setup do
      @legislation.update(body: 'New Body')
      @legislation.save!

      @most_recent = @legislation.versions.last
    end

    should 'revert the parent object to that version' do
      post :revert, id: @most_recent
      assert_redirected_to legislation_path(@legislation)
    end
  end

  context 'An invalid version' do
    should 'raise an error when trying to revert' do
      assert_raise(StandardError) do
        post :revert, id: @legislation.versions.last.id
      end
    end
  end
end
