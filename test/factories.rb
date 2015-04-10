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

    # legislation_with_attachments will create attachments data after the
    # legislation has been created
    factory :legislation_with_attachments do
      # attachments_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        attachments_count 5
      end

      # the after(:create) yields two values; the legislation instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the attachments is associated properly to the
      # legislation
      after(:create) do |legislation, evaluator|
        create_list(:attachment, evaluator.attachments_count,
                    legislation: legislation)
      end
    end
  end

  factory :meeting do
    organization
    date_and_time 1.week.ago
  end

  factory :organization do
    name  'Council'
    level 1
  end

  factory :status do
    title 'Awesome'
  end

  factory :status_update do
  end
end