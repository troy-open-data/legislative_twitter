# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  motion_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  data       :integer
#

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  context 'Vote::MAP' do
    should 'be a hash of vote integers to meanings' do
      assert Vote::MAP.is_a? Hash
    end
    context '-1' do
      should 'mean "nay"' do
        assert_match /nay/i, Vote::MAP[-1]
      end
    end
    context '0' do
      should 'mean "abstain"' do
        assert_match /abstain/i, Vote::MAP[0]
      end
    end
    context '1' do
      should 'mean "nay"' do
        assert_match /yea/i, Vote::MAP[1]
      end
    end
  end

  context 'a valid vote' do
    should 'have data' do
      assert should_validate_presence_of :data, :vote
    end
    should 'have only one vote per person per motion' do
      vote = create(:vote)
      dup_vote =    build(:vote, person: vote.person, motion: vote.motion)
      refute dup_vote.save, 'duplicate vote was saved'
      valid_vote =  build(:vote, person: vote.person, motion: create(:motion))
      assert valid_vote.save, 'valid vote for duplicate person was not saved'
      valid_vote =  build(:vote, motion: vote.motion, person: create(:person))
      assert valid_vote.save, 'valid vote for duplicate motion was not saved'
    end
  end

  context 'vote' do
    setup { @vote = create(:vote) }
    context '#type' do
      should 'be a string' do
        assert @vote.type.is_a? String
      end
    end
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
