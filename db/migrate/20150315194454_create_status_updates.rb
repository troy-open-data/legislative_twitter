class CreateStatusUpdates < ActiveRecord::Migration
  def change
    create_table :status_updates do |t|
      t.belongs_to :legislation, index: true
      t.belongs_to :status, index: true
      t.text :notes

      t.timestamps null: false
    end
    add_foreign_key :status_updates, :legislations
    add_foreign_key :status_updates, :statuses
  end
end
