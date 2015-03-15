class AddShortTitleToLegislations < ActiveRecord::Migration
  def change
    add_column :legislations, :short_title, :string
  end
end
