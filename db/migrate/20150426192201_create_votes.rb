class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :person, index: true
      t.belongs_to :folio, index: true

      t.timestamps null: false
    end
    add_foreign_key :votes, :people
    add_foreign_key :votes, :folios
  end
end
