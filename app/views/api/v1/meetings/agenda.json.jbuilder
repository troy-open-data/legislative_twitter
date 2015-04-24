json.extract! @meeting, :id, :organization_id, :date, :created_at, :updated_at, :bills
json.bills @meeting.bills do |bill|
  json.extract! bill, :id, :legislation_type, :title, :short_title
  json.url api_bill_url(bill, format: :json)
end
json.approved @meeting.minutes_approved
json.meeting_url api_meeting_url(@meeting, format: :json)
json.pdf agenda_url(@meeting, format: :pdf)
