# == Schema Information
#
# Table name: sponsorships
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  motion_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SponsorshipTest < ActiveSupport::TestCase
  should belong_to(:person)
  should belong_to(:motion)
end
