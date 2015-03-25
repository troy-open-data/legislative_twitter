# Allows for fixture_file_upload
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :attachment do
    file  { fixture_file_upload(Rails.root.join('test', 'fixtures', 'images', 'image.jpeg'), 'image/jpeg') }
  end

  factory :folio

  factory :legislation do
    title 'Resolution for Free Cake'
    body  'We should all have free cake.'
  end

  factory :meeting do
    organization
    date_and_time 1.week.ago
  end

  factory :organization do
    name  'Council'
    level 1
  end

  factory :status
  factory :status_update
end