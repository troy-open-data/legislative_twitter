class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.text :text
      t.string :heading
      t.string :subheading
      t.text :chapeau
      t.text :continuation
      t.string :type            # Inheritance column

      t.timestamps null: false
    end
  end
end
