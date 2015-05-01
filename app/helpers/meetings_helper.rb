# helper module for meetings views
module MeetingsHelper
  def list_attendees(meeting)
    if meeting.people.empty?
      'no attendees'
    else
      meeting.people.collect(&:name).join(', ')
    end
  end
end
