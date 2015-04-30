json.extract! @meeting, :id, :organization_id, :date, :created_at, :updated_at
json.attendees @meeting.people do |attendee|
  json.extract! attendee, :id, :first, :last
  json.url api_person_url(attendee, format: :json)
end
json.bills @meeting.motions do |motion|
  bill = motion.bill
  json.extract! bill, :id
  json.sponsors motion.sponsors do |sponsor|
    json.extract! sponsor, :id, :first, :last
    json.url api_person_url(sponsor, format: :json)
  end
  json.votes motion.votes.sort_by(&:type) do |vote|
    # json.yea_count motion.votes.yea.count
    # json.nea_count motion.votes.nea.count
    # json.abstain_count motion.votes.abstain.count
    json.extract! vote.person, :id, :first, :last
    json.vote vote.type
    json.person_url api_person_url(vote.person, format: :json)
  end
  json.extract! motion, :notes
  json.url api_bill_url(bill, format: :json)
end
json.approved @meeting.minutes_approved
json.meeting_url api_meeting_url(@meeting, format: :json)
json.pdf minutes_url(@meeting, format: :pdf)