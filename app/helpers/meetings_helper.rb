module MeetingsHelper

  def upcoming_meetings
    Meeting.where('date_and_time > ?', DateTime.current).order('date_and_time ASC').all
  end
end
