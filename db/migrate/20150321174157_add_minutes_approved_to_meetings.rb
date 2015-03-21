class AddMinutesApprovedToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :minutes_approved, :boolean
  end
end
