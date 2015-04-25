# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first      :string
#  last       :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
    context 'with associations' do
      should 'have many organizations through memberships' do
        relationship = Person.reflect_on_association(:organizations)
        assert_equal relationship.macro, :has_many
        assert_equal relationship.options[:through], :memberships
      end
      should 'have and belong to many meetings' do
        relationship = Person.reflect_on_association(:meetings)
        assert_equal relationship.macro, :has_many
        assert_equal relationship.options[:through], :attendances
      end
      should 'have many folios through sponsorship' do
        relationship = Person.reflect_on_association(:folios)
        assert_equal relationship.macro, :has_many
        assert_equal relationship.options[:through], :sponsorships
      end
    end
  end
end
