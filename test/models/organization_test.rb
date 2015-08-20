# == Schema Information
#
# Table name: organizations
#
#  id          :integer          not null, primary key
#  level       :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  context 'a valid organization' do
    # Associations
    should have_many(:meetings)

    should have_many(:memberships)
           .dependent(:destroy)

    should have_many(:people)
           .through(:memberships)

    # Validations
    should validate_presence_of(:name)

    should validate_presence_of(:level)
    should validate_inclusion_of(:level)
           .in_range(0...Organization::LEVELS.length)

    should 'have scope of meetable organizations' do
      assert Organization.respond_to? :meetable
    end
  end
end
