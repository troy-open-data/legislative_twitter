class AddPositionToBills < ActiveRecord::Migration
  def change
    add_column :bills, :position, :integer
  end
end
