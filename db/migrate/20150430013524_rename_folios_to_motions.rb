class RenameFoliosToMotions < ActiveRecord::Migration
  def change
    rename_table :folios, :motions
  end
end
