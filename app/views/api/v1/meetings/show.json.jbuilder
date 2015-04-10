json.extract! @meeting, :id, :name, :date, :location, :created_at, :updated_at

json.legislation_count @meeting.legislations.count

json.organization do
  json.id @meeting.organization_id
  json.name @meeting.organization.name
  json.url organization_url(@meeting.organization_id, format: :json)
end

json.agenda do
  json.approved @meeting.agenda_approved?
  json.url agenda_url(@meeting, format: :json)
end

json.minutes do
  json.approved @meeting.minutes_approved?
  json.url minutes_url(@meeting, format: :json)
end

json.legislations @meeting.folios.each do |folio|
  legislation = folio.legislation
  json.extract! legislation, :id, :title, :short_title
  json.sponsor folio.sponsor
  json.url api_legislation_url(legislation, format: :json)
end
