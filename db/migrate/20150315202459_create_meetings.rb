class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.belongs_to :organization, index: true
      t.date :date

      t.timestamps null: false
    end
    add_foreign_key :meetings, :organizations
  end
end
