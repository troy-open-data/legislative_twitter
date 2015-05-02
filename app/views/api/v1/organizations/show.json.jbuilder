json.extract! @organization, :id, :level, :name, :description, :created_at, :updated_at

json.members @organization.people do |member|
  json.extract! member, :id, :first, :last
  json.url api_v1_person_url(member, format: :json)
end

json.meetings @organization.meetings do |meeting|
  json.extract! meeting, :id, :date_and_time
  json.url api_v1_meeting_url(meeting, format: :json)
end

json.organizations_url api_v1_organizations_url(format: :json)