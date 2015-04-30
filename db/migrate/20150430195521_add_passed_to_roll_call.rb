class AddPassedToRollCall < ActiveRecord::Migration
  def change
    add_column :roll_calls, :passed, :boolean
  end
end
