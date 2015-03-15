class CreateDockets < ActiveRecord::Migration
  def change
    create_table :dockets do |t|
      t.belongs_to :meeting, index: true

      t.timestamps null: false
    end
    add_foreign_key :dockets, :meetings
  end
end
