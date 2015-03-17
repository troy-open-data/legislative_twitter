# == Schema Information
#
# Table name: folios
#
#  id             :integer          not null, primary key
#  meeting_id     :integer
#  legislation_id :integer
#  notes          :text
#  vote           :string
#  sponsor        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Folio < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :legislation
end
