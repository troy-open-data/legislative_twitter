class CreateRecitals < ActiveRecord::Migration
  def change
    create_table :recitals do |t|
      t.string :clause
      t.string :prefix
      t.belongs_to :bill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

