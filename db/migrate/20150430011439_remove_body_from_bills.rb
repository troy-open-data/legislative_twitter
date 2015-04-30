class RemoveBodyFromBills < ActiveRecord::Migration
  def change
    remove_column :bills, :body, :text
  end
end
