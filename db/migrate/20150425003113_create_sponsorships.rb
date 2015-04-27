class CreateSponsorships < ActiveRecord::Migration
  def change
    create_table :sponsorships do |t|
      t.belongs_to :person, index: true
      t.belongs_to :folio, index: true

      t.timestamps null: false
    end
  end
end
