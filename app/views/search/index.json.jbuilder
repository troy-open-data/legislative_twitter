json.array!(@bills) do |legislation|
  json.extract! legislation, :id, :legislation_type, :title, :short_title, :body
  json.url legislation_url(legislation, format: :json)
end