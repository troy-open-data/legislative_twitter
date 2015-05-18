class ChangeVoteFormatInVotes < ActiveRecord::Migration
  MAP = { 1   => 'yea',
          -1  => 'nay',
          0   => 'abstain' }

  def up
    change_column :votes, :vote, :string

    Vote.find_each do |v|
      v.vote = MAP[v.vote.to_i]
      v.save!
    end
  end

  def down
    change_column :votes, :vote, :integer

    Vote.find_each do |v|
      v.vote = MAP.invert[v.vote]
      v.save!
    end
  end
end
