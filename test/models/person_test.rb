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
  should validate_presence_of :first
  should validate_presence_of :last

  should have_many(:memberships).dependent(:destroy)
  should have_many(:organizations).through(:memberships)

  should have_many(:sponsorships).dependent(:destroy)
  should have_many(:motions).through(:sponsorships)

  should have_many(:votes).dependent(:destroy)

  should have_many(:attendances).dependent(:destroy)
  should have_many(:meetings).through(:attendances)

  should 'have a full name' do
    person = create(:person)
    assert person.respond_to? :name
  end
end
