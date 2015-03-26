class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.integer :level
      t.string :name

      t.timestamps null: false
    end
  end
end
