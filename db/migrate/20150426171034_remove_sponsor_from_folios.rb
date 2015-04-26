class RemoveSponsorFromFolios < ActiveRecord::Migration
  def change
    remove_column :folios, :sponsor, :string
  end
end
