# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  person_id    :integer
#  motion_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  vote         :string
#  roll_call_id :integer
#

require 'test_helper'

# Vote model unit tests
class VoteTest < ActiveSupport::TestCase
  # Validations
  should validate_presence_of(:vote)
  should validate_inclusion_of(:vote).in_array(Vote::VALID)
  # should validate_uniqueness_of(:person_id).scoped_to(:roll_call_id)

  # Associations
  should belong_to(:roll_call)
  should belong_to(:person)

  context 'a valid vote' do
    should 'have only one vote per person per roll call' do
      vote = create(:vote)
      dup_vote =    build(:vote, person: vote.person, roll_call: vote.roll_call)
      refute dup_vote.save, 'duplicate vote was saved'
      valid_vote =  build(:vote, person: vote.person, roll_call: create(:roll_call))
      assert valid_vote.save, 'valid vote for duplicate person was not saved'
      valid_vote =  build(:vote, roll_call: vote.roll_call, person: create(:person))
      assert valid_vote.save, 'valid vote for duplicate roll call was not saved'
    end
  end

  context 'Vote' do
    context '#collection_text_method' do
      setup { @text = Vote.collection_text }
      should 'return votes formatted for collection form helpers' do
        assert @text.is_a? Array
        assert_equal [], Vote::VALID - @text.flatten
      end
    end
  end

  context 'vote' do
    setup { @vote = create(:vote) }
    context 'scopes' do
      should 'respond to yeas' do
        assert Vote.respond_to? :yeas
      end
      should 'respond to nays' do
        assert Vote.respond_to? :nays
      end
      should 'respond to abstains' do
        assert Vote.respond_to? :abstains
      end
    end
  end
end
