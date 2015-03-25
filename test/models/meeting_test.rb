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
    assert @meeting.respond_to? :organization
  end

  test 'has many folios' do
    assert @meeting.respond_to? :folios
  end
  test 'can destroy dependent folios' do
    @folio = Folio.new(meeting: @meeting)
    @folio.save!
    assert Folio.exists? @folio.id

    @meeting.destroy!
    refute Folio.exists? @folio.id
  end
  test 'has many legislations' do
    assert @meeting.respond_to? :legislations
  end

  ## Validations ###############################################################
  # test 'must have organization'
  # test 'must have date_and_time'

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
    assert_equal @meeting.has_happened?, @meeting.is_started?
    @meeting.date_and_time = 2.years.from_now
    assert_equal @meeting.has_happened?, @meeting.is_started?
  end

  ## Scopes and Class Methods ##################################################

  ## Instance Methods ##########################################################
  # test 'grouped_legislations'
  # test 'name'
  # test 'datetimepicker_value'
  # test 'has_happened?'
  # test 'toggle_approval'

end
