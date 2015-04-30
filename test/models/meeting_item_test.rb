require 'test_helper'

class MeetingItemTest < ActiveSupport::TestCase
  context 'a valid meeting item' do
    should 'belong to a meeting' do
      assert should_belong_to MeetingItem, :meeting
    end
  end
end
