# == Schema Information
#
# Table name: meeting_items
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  meeting_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MeetingItemTest < ActiveSupport::TestCase
  should belong_to(:meeting)
end
