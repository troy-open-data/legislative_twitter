class RenameRollCallToQuestion < ActiveRecord::Migration
  def change
    rename_table  :roll_calls,  :questions
    rename_column :votes,       :roll_call_id,  :question_id
  end
end
