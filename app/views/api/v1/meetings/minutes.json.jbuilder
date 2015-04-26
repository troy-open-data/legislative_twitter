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
  json.extract! folio, :vote, :notes
  json.url api_bill_url(bill, format: :json)
end
json.approved @meeting.minutes_approved
json.meeting_url api_meeting_url(@meeting, format: :json)
json.pdf minutes_url(@meeting, format: :pdf)