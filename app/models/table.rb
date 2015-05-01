# == Schema Information
#
# Table name: roll_calls
#
#  id         :integer          not null, primary key
#  type       :string
#  notes      :text
#  motion_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  passed     :boolean
#

class Table < RollCall; end
