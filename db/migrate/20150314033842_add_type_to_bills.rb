class AddTypeToBills < ActiveRecord::Migration
  def up
    change_table :bills do |t|
      t.string :legislation_type, default: Bill::LEGISLATION_TYPES[0]
    end

    # Ensure that there are no nil values for bill type in the database
    # NULL is disallowed, and all existing NULL values are set to
    # Bill::LEGISLATION_TYPES[0]
    change_column_null :bills,
                       :legislation_type,
                       false,
                       Bill::LEGISLATION_TYPES[0]
  end
  def down
    remove_column :bills, :legislation_type
  end
end
