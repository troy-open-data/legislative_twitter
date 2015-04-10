require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'api version defaults to v1' do
    assert_generates '/api/legislations', { controller: '/api/v1/legislations',
                                            action: 'index'}
  end
end