# Allows for fixture_file_upload
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :recital do
    clause    'lorem'
    bill
  end

  factory :admin do
    email     'email@email.com'
    password  'password'
  end

  factory :attachment do
    file  { fixture_file_upload(Rails.root.join('test', 'fixtures', 'images', 'image.jpeg'), 'image/jpeg') }
  end

  factory :bill do
    title             'Resolution for Free Cake'
    short_title       'Free Cake'
    body              'We should all have free cake.'

    factory :legislation_with_attachments do

      transient do
        attachments_count 5
      end

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