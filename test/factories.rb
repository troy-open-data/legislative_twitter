# Allows for fixture_file_upload
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :admin do
    email     'email@email.com'
    password  'password'
  end

  factory :attachment do
    file  { fixture_file_upload(Rails.root.join('test', 'fixtures', 'images', 'image.jpeg'), 'image/jpeg') }
  end

  factory :bill do
    title 'Resolution for Free Cake'
    body  'We should all have free cake.'

    # legislation_with_attachments will create attachments data after the
    # bill has been created
    factory :legislation_with_attachments do
      # attachments_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        attachments_count 5
      end

      # the after(:create) yields two values; the bill instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the attachments is associated properly to the
      # bill
      after(:create) do |bill, evaluator|
        create_list(:attachment, evaluator.attachments_count,
                    bill: bill)
      end
    end
  end

  factory :meeting do
    organization
    date_and_time 1.week.ago

    factory :meeting_with_bill do
      after(:create) { |meeting| meeting.bills << create(:bill) }
    end
  end

  factory :folio do
    bill
    meeting
  end

  factory :organization do
    name  'Council'
    level 1
  end

  factory :person do
    first 'George'
    last  'Washington'
  end

  factory :vote do
    data 0
  end
end