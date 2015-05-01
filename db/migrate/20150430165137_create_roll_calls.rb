class CreateRollCalls < ActiveRecord::Migration
  def change
    create_table :roll_calls do |t|
      t.string :type
      t.text :notes
      t.belongs_to :motion, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
