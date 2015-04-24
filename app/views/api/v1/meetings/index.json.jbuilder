json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name, :date, :location

  json.legislation_count meeting.bills.count

  json.organization do
    json.id meeting.organization_id
    json.name meeting.organization.name
    json.url organization_url(meeting.organization_id, format: :json)
  end

  json.agenda agenda_url(meeting, format: :json)

  json.minutes minutes_url(meeting, format: :json)

  json.url api_meeting_url(meeting, format: :json)
end
