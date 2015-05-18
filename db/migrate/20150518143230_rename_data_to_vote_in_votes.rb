class RenameDataToVoteInVotes < ActiveRecord::Migration
  def change
    rename_column :votes, :data, :vote
  end
end
