# == Schema Information
#
# Table name: attendances
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  meeting_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attendance < ActiveRecord::Base
  belongs_to :person
  belongs_to :meeting
end
