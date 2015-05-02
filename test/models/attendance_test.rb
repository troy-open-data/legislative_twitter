# == Schema Information
#
# Table name: attendances
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  meeting_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AttendanceTest < ActiveSupport::TestCase
  should belong_to(:person)
  should belong_to(:meeting)
end
