json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name, :date, :location

  json.bill_count meeting.bills.count

  json.organization do
    json.id meeting.organization_id
    json.name meeting.organization.name
    json.url api_v1_organization_url(meeting.organization_id, format: :json)
  end

  json.agenda do
    json.approved !!meeting.agenda_approved
    json.pdf agenda_url(meeting, format: :pdf)
  end

  json.minutes do
    json.approved !!meeting.minutes_approved
    json.pdf minutes_url(meeting, format: :pdf)
  end

  json.url api_v1_meeting_url(meeting, format: :json)
end
