class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :bill
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
