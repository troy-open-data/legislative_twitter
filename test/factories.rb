# Allows for fixture_file_upload
include ActionDispatch::TestProcess

FactoryGirl.define do
  # Levels
  factory :section do
    bill
  end
  factory :sub_section do
    section
  end
  factory :paragraph do
    sub_section
  end
  factory :sub_paragraph do
    paragraph
  end

  factory :recital do
    clause 'cake is good'
    bill
  end

  factory :user do
    email 'email@email.com'
    password 'password'
  end

  factory :attachment do
    file  { fixture_file_upload(Rails.root.join('test', 'fixtures', 'images', 'image.jpeg'), 'image/jpeg') }
  end

  factory :bill do
    title 'Resolution for Free Cake'
    short_title 'Free Cake'

    factory :legislation_with_attachments do
      transient { attachments_count 5 }

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

  factory :motion do
    bill
    meeting
  end

  factory :organization do
    name 'Council'
    level 1
  end

  factory :person do
    first 'George'
    last 'Washington'
  end

  factory :question do
    motion
  end

  factory :vote do
    vote 'abstain'
    question
  end
end
