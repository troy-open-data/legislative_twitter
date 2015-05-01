json.extract! @bill, :id, :legislation_type, :title, :short_title, :created_at, :updated_at
json.pdf bill_url(@bill, format: :pdf)
