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

class Membership < ActiveRecord::Base
  belongs_to :person
  belongs_to :organization
end
