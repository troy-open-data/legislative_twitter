require 'test_helper'

class VersionsControllerTest < ActionController::TestCase
  def setup
    @legislation = create(:legislation)

    @legislation.update(body: 'New Body')
    @legislation.save!
    @most_recent = @legislation.versions.last

    request.env['HTTP_REFERER'] = legislations_path
  end

  test 'revert should add a new version' do
    assert_difference('@legislation.versions.count') do
      post :revert, id: @most_recent
    end
  end

  test 'should revert a legislation to a version' do
    post :revert, id: @most_recent
    assert_redirected_to legislation_path(@legislation)
  end
end
