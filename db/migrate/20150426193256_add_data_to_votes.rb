class AddDataToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :data, :integer
  end
end
