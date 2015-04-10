json.array!(@legislations) do |legislation|
  json.extract! legislation, :id, :legislation_type, :title, :short_title, :body
  json.url api_legislation_url(legislation, format: :json)
end
