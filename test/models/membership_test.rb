# == Schema Information
#
# Table name: memberships
#
#  id              :integer          not null, primary key
#  person_id       :integer
#  organization_id :integer
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  should belong_to(:person)
  should belong_to(:organization)
end
