json.array!(@legislations) do |legislation|
  json.extract! legislation, :id, :title, :body
  json.url legislation_url(legislation, format: :json)
end
