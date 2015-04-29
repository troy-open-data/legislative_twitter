class AddBillToSections < ActiveRecord::Migration
  def change
    add_reference :levels, :bill, index: true, foreign_key: true
  end
end
