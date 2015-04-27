json.extract! @meeting, :id, :organization_id, :date, :created_at, :updated_at
json.attendees @meeting.people do |attendee|
  json.extract! attendee, :id, :first, :last
  json.url api_person_url(attendee, format: :json)
end
json.bills @meeting.folios do |folio|
  bill = folio.bill
  json.extract! bill, :id
  json.sponsors folio.sponsors do |sponsor|
    json.extract! sponsor, :id, :first, :last
    json.url api_person_url(sponsor, format: :json)
  end
  json.votes folio.votes.sort_by(&:type) do |vote|
    # json.yea_count folio.votes.yea.count
    # json.nea_count folio.votes.nea.count
    # json.abstain_count folio.votes.abstain.count
    json.extract! vote.person, :id, :first, :last
    json.vote vote.type
    json.person_url api_person_url(vote.person, format: :json)
  end
  json.extract! folio, :notes
  json.url api_bill_url(bill, format: :json)
end
json.approved @meeting.minutes_approved
json.meeting_url api_meeting_url(@meeting, format: :json)
json.pdf minutes_url(@meeting, format: :pdf)