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
  ## Setup and Teardown ########################################################
  def setup
    @organization = create(:organization)
  end

  ## Associations ##############################################################
  test 'has many meetings' do
    assert @organization.respond_to? :meetings
  end

  ## Validations ###############################################################
  # test 'validates presence of name'
  # test 'validates presence of level'
  # test 'validates inclusion of level within given levels'

  ## Scopes and Class Methods ##################################################
  test 'has scope of meetable organizations' do
    assert Organization.respond_to? :meetable
  end
end
