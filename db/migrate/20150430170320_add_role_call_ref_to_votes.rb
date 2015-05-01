class AddRoleCallRefToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :roll_call, index: true, foreign_key: true
  end
end
