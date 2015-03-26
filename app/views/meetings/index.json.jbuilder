json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :organization_id, :date
  json.url meeting_url(meeting, format: :json)
end
