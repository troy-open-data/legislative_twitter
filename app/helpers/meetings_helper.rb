module MeetingsHelper

  def upcoming_meetings
    Meeting.where('date > ?', Date.today).order('date ASC').all
  end
end
