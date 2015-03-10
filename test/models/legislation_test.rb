# == Schema Information
#
# Table name: legislations
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LegislationTest < ActiveSupport::TestCase
  def setup
    @legislation = Legislation.new(title: legislations(:one).title,
                                   body:  legislations(:one).body)
    @legislation.save!
  end

  # Legislation methods
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

  # Paper Trail Tests
  test "legislations should have paper trails" do
    assert @legislation.respond_to? :versions
  end

  test "new legislations should have one version marking creation" do
    assert_equal 1, @legislation.versions.count
    assert_equal "create", @legislation.versions.last.event
  end

  test "updating legislation should add version marking update" do
    assert_difference('@legislation.versions.count') do
      @legislation.update(title: 'New Title')
    end
    assert_equal "update", @legislation.versions.last.event
  end

  test "deleting legislation should add version marking destroy" do
    assert_difference('@legislation.versions.count') do
      @legislation.destroy
    end
    assert_equal "destroy", @legislation.versions.last.event
  end

  test "legislations should have paper trail changesets" do
    assert @legislation.versions.last.respond_to? :changeset
  end
end
