# == Schema Information
#
# Table name: meetings
#
#  id               :integer          not null, primary key
#  organization_id  :integer
#  date_and_time    :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  agenda_approved  :boolean
#  minutes_approved :boolean
#  location         :string
#

require 'test_helper'

class MeetingTest < ActiveSupport::TestCase
  ## Setup and Teardown ########################################################
  def setup
    @meeting = create(:meeting)
  end

  ## Associations ##############################################################
  test 'belongs to one organization' do
    assert should_belong_to(Meeting, :organization)
  end

  test 'has many motions' do
    assert should_have_many(Meeting, :motions)
  end
  test 'can destroy dependent folios' do
    @motion = Motion.new(meeting: @meeting)
    @motion.save!
    assert Motion.exists? @motion.id

    @meeting.destroy!
    refute Motion.exists? @motion.id
  end
  test 'has many bills' do
    assert should_have_many(Meeting, :bills)
  end

  ## Validations ###############################################################
  test 'must have organization' do
    assert should_validate_presence_of :organization_id, :meeting
  end

  test 'must have date_and_time' do
    assert should_validate_presence_of :date_and_time, :meeting
  end

  ## Aliases ###################################################################
  test 'approved_agenda? is an alias of agenda_approved' do
    [true, false].each do |boolean|
      @meeting.agenda_approved = boolean
      assert_equal @meeting.agenda_approved, @meeting.approved_agenda?
    end
  end
  test 'approved_minutes? is an alias of minutes_approved' do
    [true, false].each do |boolean|
      @meeting.minutes_approved = boolean
      assert_equal @meeting.minutes_approved, @meeting.approved_minutes?
    end
  end
  test 'date is an alias of date_and_time' do
    @meeting.date_and_time = 2.years.ago
    assert_equal @meeting.date, @meeting.date_and_time
  end
  test 'is_started? is an alias of has_happened?' do
    @meeting.date_and_time = 2.years.ago
    assert_equal @meeting.happened?, @meeting.started?
    @meeting.date_and_time = 2.years.from_now
    assert_equal @meeting.happened?, @meeting.started?
  end

  ## Scopes and Class Methods ##################################################
  test 'upcoming' do
    assert Meeting.respond_to? :upcoming
  end

  ## Instance Methods ##########################################################
  test '#grouped_legislations' do
    @meeting.respond_to? :grouped_bills
  end
  test '#grouped_motions' do
    @meeting.respond_to? :grouped_motions
  end
  # test 'name'
  # test 'datetimepicker_value'
  # test 'has_happened?'
  # test 'toggle_approval'
end
