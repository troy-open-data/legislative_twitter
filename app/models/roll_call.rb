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
#

class RollCall < ActiveRecord::Base
  TYPES = %w(Accept Call\ the\ Question Table)

  belongs_to :motion
  has_many :votes,              dependent: :destroy
  accepts_nested_attributes_for :votes,
                                reject_if: ->(attr) { attr[:data].blank? },
                                allow_destroy: true

  validates :type,  presence: true,
                    inclusion: TYPES
end
