require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'api version defaults to v1' do
    assert_generates '/api/bills', { controller: '/api/v1/bills',
                                            action: 'index'}
  end
end