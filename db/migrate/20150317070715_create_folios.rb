class CreateFolios < ActiveRecord::Migration
  def change
    create_table :folios do |t|
      t.belongs_to :meeting, index: true
      t.references :bill, index: true
      t.text :notes
      t.string :vote
      t.string :sponsor

      t.timestamps null: false
    end
    add_foreign_key :folios, :meetings
    add_foreign_key :folios, :bills
  end
end
