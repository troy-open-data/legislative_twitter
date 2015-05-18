require 'test_helper'

class SubSectionTest < ActiveSupport::TestCase
  should belong_to(:section)
  should have_many(:paragraphs)
  should accept_nested_attributes_for(:paragraphs)
end
