# helper module for meetings views
module MeetingsHelper
  def list_attendees(meeting)
    if meeting.people.empty?
      'no attendees'
    else
      meeting.people.collect(&:name).join(', ')
    end
  end

  def print_votes(roll_call)
    votes = roll_call.votes
    if votes.empty?
      'no vote recorded'
    else
      "#{votes.yeas.count}-#{votes.nays.count}-#{votes.abstains.count}"
    end
  end
end
