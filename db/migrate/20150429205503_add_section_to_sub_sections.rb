class AddSectionToSubSections < ActiveRecord::Migration
  def change
    add_reference :levels, :level, index: true, foreign_key: true
  end
end
