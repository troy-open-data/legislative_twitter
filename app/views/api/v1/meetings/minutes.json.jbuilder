json.extract! @meeting, :id, :organization_id, :date, :created_at, :updated_at
json.bills @meeting.folios do |folio|
  bill = folio.bill
  json.extract! bill, :id
  json.extract! folio, :sponsor, :vote, :notes
  json.url api_bill_url(bill, format: :json)
end
json.meeting_url api_meeting_url(@meeting, format: :json)
json.pdf minutes_url(@meeting, format: :pdf)