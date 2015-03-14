class AddTypeToLegislations < ActiveRecord::Migration
  def up
    change_table :legislations do |t|
      t.string :legislation_type, default: Legislation::LEGISLATION_TYPES[0]
    end

    # Ensure that there are no nil values for legislation type in the database
    # NULL is disallowed, and all existing NULL values are set to
    # Legislation::LEGISLATION_TYPES[0]
    change_column_null :legislations,
                       :legislation_type,
                       false,
                       Legislation::LEGISLATION_TYPES[0]
  end
  def down
    remove_column :legislations, :legislation_type
  end
end
