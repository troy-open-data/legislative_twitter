json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name, :date, :location

  json.bill_count meeting.bills.count

  json.organization do
    json.id meeting.organization_id
    json.name meeting.organization.name
    json.url api_organization_url(meeting.organization_id, format: :json)
  end

  json.agenda do
    json.url api_agenda_url(meeting, format: :json)
    json.pdf agenda_url(meeting, format: :pdf)
  end

  json.minutes do
    json.url api_minutes_url(meeting, format: :json)
    json.pdf minutes_url(meeting, format: :pdf)
  end

  json.url api_meeting_url(meeting, format: :json)
end
