class AddDocketToMeetings < ActiveRecord::Migration
  def change
    add_reference :meetings, :docket, index: true
    add_foreign_key :meetings, :dockets
  end
end
