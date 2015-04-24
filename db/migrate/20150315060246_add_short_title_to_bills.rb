class AddShortTitleToBills < ActiveRecord::Migration
  def change
    add_column :bills, :short_title, :string
  end
end
