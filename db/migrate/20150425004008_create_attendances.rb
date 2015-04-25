class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.belongs_to :person, index: true
      t.belongs_to :meeting, index: true

      t.timestamps null: false
    end
  end
end
