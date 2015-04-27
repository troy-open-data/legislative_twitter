class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :person, index: true
      t.belongs_to :organization, index: true
      t.string :role

      t.timestamps null: false
    end
  end
end
