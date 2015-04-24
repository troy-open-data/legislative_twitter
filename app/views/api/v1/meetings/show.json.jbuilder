json.extract! @meeting, :id, :name, :date, :location, :created_at, :updated_at

json.organization do
  json.id @meeting.organization_id
  json.name @meeting.organization.name
  json.url api_organization_url(@meeting.organization_id, format: :json)
end

json.agenda do
  json.approved @meeting.agenda_approved?
  json.url api_agenda_url(@meeting, format: :json)
  json.pdf agenda_url(@meeting, format: :pdf)
end

json.minutes do
  json.approved @meeting.minutes_approved?
  json.url api_minutes_url(@meeting, format: :json)
  json.pdf minutes_url(@meeting, format: :pdf)
end

json.bills @meeting.folios.each do |folio|
  legislation = folio.bill
  json.extract! legislation, :id, :title, :short_title
  json.sponsor folio.sponsor
  json.url api_bill_url(legislation, format: :json)
end
