class ChangeFolioIdToMotionId < ActiveRecord::Migration
  def change
    rename_column :sponsorships,  :folio_id, :motion_id
    rename_column :votes,         :folio_id, :motion_id
  end
end
