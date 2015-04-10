require 'test_helper'

class VersionsControllerTest < ActionController::TestCase
  context 'A previous version of an object' do
    setup do
      @legislation = create(:legislation)
      @legislation.update(body: 'New Body')
      @legislation.save!

      @most_recent = @legislation.versions.last

      request.env['HTTP_REFERER'] = legislations_path
    end

    should 'revert the parent object to that version' do
      post :revert, id: @most_recent
      assert_redirected_to legislation_path(@legislation)
    end
  end
end
