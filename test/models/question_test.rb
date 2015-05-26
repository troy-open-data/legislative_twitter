# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  type       :string
#  notes      :text
#  motion_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  passed     :boolean
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  should belong_to(:motion)
  should have_many(:votes)
  should accept_nested_attributes_for(:votes)

  should validate_inclusion_of(:type).in_array(Question::TYPES)
  should 'have a default type of Pass' do
    question = create(:question)
    assert_equal 'Pass', question.type
  end

  context 'RollCall' do
    context '#select_method' do
      should 'return a zipped array including roll call types' do
        select = Question.select_text.flatten
        assert_equal [], Question::TYPES - select
      end
    end
  end

  context 'question' do
    context '#result' do
      should 'return "Passed" if passed' do
        rc = create(:question, passed: true)
        assert_equal 'Passed', rc.result
      end
      should 'return "Failed" if not passed' do
        rc = create(:question, passed: false)
        assert_equal 'Failed', rc.result
      end
    end
  end
end
