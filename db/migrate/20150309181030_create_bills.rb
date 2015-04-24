class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
