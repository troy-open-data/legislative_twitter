require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  context 'api' do
    setup { get api_v1_root_path }
    should 'default to json format' do
      assert_equal Mime::JSON, response.content_type
    end
  end
end
