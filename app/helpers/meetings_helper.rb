module MeetingsHelper
  def list_attendees(meeting)
    if meeting.people.empty?
      'no attendees'
    else
      meeting.people.collect(&:name).join(', ')
    end
  end

  def print_votes(folio)
    votes = folio.votes
    if votes.empty?
      'no vote recorded'
    else
      "#{votes.yeas.count.to_s}-#{votes.nays.count.to_s}-#{votes.abstains.count.to_s}"
    end
  end
end
