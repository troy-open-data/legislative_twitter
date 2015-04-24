require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  context 'a valid person' do
    should 'have a first name' do
      person = build(:person, first: nil)
      assert_raise(ActiveRecord::RecordInvalid) { person.save! }
    end
    should 'have a last name' do
      person = build(:person, last: nil)
      assert_raise(ActiveRecord::RecordInvalid) { person.save! }
    end
  end
end
