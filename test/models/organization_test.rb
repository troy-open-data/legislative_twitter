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
    setup do
      @organization = create(:organization)
    end

    should 'have a name' do
      assert should_validate_presence_of :name, :organization
    end
    should 'have a level' do
      assert should_validate_presence_of :level, :organization
    end
    should 'have a level within valid levels' do
      @organization.update(level: Organization::LEVELS.size + 2)
      assert_not @organization.save, 'saved organization with an invalid level'
    end
    should 'have scope of meetable organizations' do
      assert Organization.respond_to? :meetable
    end

    context 'with associations' do
      should 'has many meetings' do
        assert should_have_many(Organization, :meetings)
      end
      should 'has many people through memberships' do
        assert should_have_many_through(Organization, :people, :memberships)
      end
    end
  end
end
