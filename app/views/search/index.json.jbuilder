json.array!(@bills) do |legislation|
  json.extract! legislation, :id, :type, :title, :short_title, :body
  json.url legislation_url(legislation, format: :json)
end