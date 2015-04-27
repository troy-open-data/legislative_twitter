class RemoveVoteFromFolios < ActiveRecord::Migration
  def change
    remove_column :folios, :vote, :string
  end
end
