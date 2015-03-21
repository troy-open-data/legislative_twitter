class ChangeDataTypeForMeetingsDate < ActiveRecord::Migration
  def self.up
    change_table :meetings do |t|
      t.change :date, :datetime
      t.rename :date, :date_and_time
    end
  end
  def self.down
    change_table :meetings do |t|
      t.rename :date_and_time, :date
      t.change :date, :date
    end
  end
end
