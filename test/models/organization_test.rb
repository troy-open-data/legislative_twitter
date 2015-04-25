# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  level      :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  context 'a valid organization' do
    setup do
      @organization = create(:organization)
    end

    should 'have a name' do
      @organization.update(name: nil)
      assert_not @organization.save, 'saved organization without a name'
    end
    should 'have a level' do
      @organization.update(level: nil)
      assert_not @organization.save, 'saved organization without a level'
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
        relationship = Organization.reflect_on_association(:meetings)
        assert_equal relationship.macro, :has_many
      end
      should 'have and belong to many meetings' do
        relationship = Organization.reflect_on_association(:people)
        assert_equal relationship.macro, :has_many
        assert_equal relationship.options[:through], :memberships
      end
    end
  end
end
