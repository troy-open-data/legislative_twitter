class AddAgendaApprovedToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :agenda_approved, :boolean
  end
end
