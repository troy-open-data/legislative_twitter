json.array!(@bills) do |bill|
  json.extract! bill, :id, :legislation_type, :title, :short_title, :body
  json.url api_bill_url(bill, format: :json)
  json.pdf bill_url(bill, format: :pdf)
end
