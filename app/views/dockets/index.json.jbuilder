json.array!(@dockets) do |docket|
  json.extract! docket, :id, :meeting_id
  json.url docket_url(docket, format: :json)
end
