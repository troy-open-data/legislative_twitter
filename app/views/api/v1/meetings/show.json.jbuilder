json.extract! @meeting, :id, :name, :date, :location, :created_at, :updated_at

json.organization do
  json.id @meeting.organization_id
  json.name @meeting.organization.name
  json.url api_organization_url(@meeting.organization_id, format: :json)
end

json.agenda do
  json.approved @meeting.agenda_approved?
  json.pdf agenda_url(@meeting, format: :pdf)
end

json.minutes do
  json.approved @meeting.minutes_approved?
  json.pdf minutes_url(@meeting, format: :pdf)
end

json.attendees @meeting.people do |attendee|
  json.extract! attendee, :id, :first, :last
  json.url api_person_url(attendee, format: :json)
end

json.bills @meeting.motions.each do |motion|
  bill = motion.bill
  json.extract! bill, :id, :title, :short_title
  json.sponsors motion.sponsors do |sponsor|
    json.extract! sponsor, :id, :first, :last
    json.url api_person_url(sponsor, format: :json)
  end
  json.votes motion.votes.sort_by(&:type) do |vote|
    json.extract! vote.person, :id, :first, :last
    json.vote vote.type
    json.person_url api_person_url(vote.person, format: :json)
  end
  json.extract! motion, :notes
  json.url api_bill_url(bill, format: :json)
end
