# == Schema Information
#
# Table name: dockets
#
#  id         :integer          not null, primary key
#  meeting_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Docket < ActiveRecord::Base
  belongs_to :meeting #, dependent: :destroy
  has_one :organization, through: :meeting
  has_many :snippets, dependent: :destroy
end
