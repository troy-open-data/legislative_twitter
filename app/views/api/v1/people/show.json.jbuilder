json.extract! @person, :id, :first, :last, :bio, :created_at, :updated_at

json.memberships @person.organizations do |organization|
  json.extract! organization, :id, :name
end

json.sponsorships @person.motions.collect(&:bill).flatten do |bill|
  json.extract! bill, :title, :short_title, :id
end

json.people_url api_people_url(format: :json)

