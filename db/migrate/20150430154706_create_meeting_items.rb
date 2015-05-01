class CreateMeetingItems < ActiveRecord::Migration
  def change
    create_table :meeting_items do |t|
      t.string :title
      t.text :text
      t.belongs_to :meeting, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
