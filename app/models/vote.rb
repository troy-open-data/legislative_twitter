# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  motion_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  data       :integer
#

class Vote < ActiveRecord::Base
  MAP = { 1   => 'yea',
          -1  => 'nay',
          0   => 'abstain' }

  belongs_to :person
  belongs_to :motion
  #
  scope :yeas,      -> { where(data: 1) }
  scope :nays,      -> { where(data: -1) }
  scope :abstains,  -> { where(data: 0) }

  validates :data, presence: :true
  validates :person_id, uniqueness: { scope: :motion_id }

  def type
    MAP[data]
  end
end
