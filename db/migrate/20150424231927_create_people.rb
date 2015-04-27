class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first
      t.string :last
      t.text :bio

      t.timestamps null: false
    end
  end
end
