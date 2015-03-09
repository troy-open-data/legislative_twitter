require 'test_helper'

class LegislationTest < ActiveSupport::TestCase
  def setup
    @legislation = legislations(:one)
  end
  test "created_at_time should contain the year, month, and day of creation" do
    created_datetime = @legislation.created_at
    created_string = @legislation.created_at_time
    assert_match /#{created_datetime.year}/, created_string,
                 "should contain the year of creation"
    assert_match /#{Date::MONTHNAMES[created_datetime.month]}/, created_string,
                 "should contain the fulltext month of creation"
    assert_match /#{created_datetime.day}/, created_string,
                 "should contain the day of creation"
  end
end
