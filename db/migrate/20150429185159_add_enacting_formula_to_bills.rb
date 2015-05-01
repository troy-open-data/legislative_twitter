class AddEnactingFormulaToBills < ActiveRecord::Migration
  def change
    add_column :bills, :enacting_formula, :string
  end
end
