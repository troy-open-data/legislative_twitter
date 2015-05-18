class RenameLegislationTypeToType < ActiveRecord::Migration
  def change
    rename_column :bills, :legislation_type, :type
  end
end
