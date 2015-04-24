json.extract! @meeting, :id, :organization_id, :date, :created_at, :updated_at, :bills
json.meeting_url api_meeting_url(@meeting, format: :json)
