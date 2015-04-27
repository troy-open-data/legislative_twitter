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
      assert should_validate_presence_of :first, :person
    end
    should 'have a last name' do
      assert should_validate_presence_of :last, :person
    end
    context 'with associations' do
      should 'have many organizations through memberships' do
        assert should_have_many_through(Person, :organizations, :memberships)
      end
      should 'have and belong to many meetings' do
        assert should_have_many_through(Person, :meetings, :attendances)
      end
      should 'have many folios (sponsored_bills) through sponsorship' do
        assert should_have_many_through(Person, :sponsored_bills, :sponsorships)
      end
      should 'have many votes' do
        assert should_have_many(Person, :votes)
      end
    end
  end

  context 'a person' do
    setup do
      @person = create(:person)
    end
    should 'have a full name' do
      assert @person.respond_to? :name
    end
  end
end
