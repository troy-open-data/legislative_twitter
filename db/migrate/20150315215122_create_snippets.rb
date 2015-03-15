class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.references :docket, index: true
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :snippets, :dockets
  end
end
