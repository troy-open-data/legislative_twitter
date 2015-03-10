require 'test_helper'

class VersionsControllerTest < ActionController::TestCase
  def setup
    @legislation = legislations(:one)
    request.env["HTTP_REFERER"] = legislations_path
  end

  test "revert should change the object back to a version" do
    @legislation.update(title: 'New Title')
    @legislation.update(body: 'New Body')
    @legislation.save!
    most_recent = @legislation.versions.last
    #flunk most_recent.changeset.inspect

    post :revert, id: most_recent
  end
end
