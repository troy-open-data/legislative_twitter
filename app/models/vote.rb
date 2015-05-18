# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  person_id    :integer
#  motion_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  vote         :string
#  roll_call_id :integer
#

class Vote < ActiveRecord::Base
  VALID = %w(yea nay abstain)

  belongs_to :person
  belongs_to :roll_call

  scope :yeas,      -> { where(vote: 'yea') }
  scope :nays,      -> { where(vote: 'nay') }
  scope :abstains,  -> { where(vote: 'abstain') }

  validates :vote,      presence: :true,
                        inclusion: VALID
  validates :person_id, uniqueness: { scope: :roll_call_id }

  # @return [Array<Array>] vote options formatted for collection form helpers
  def self.collection_text
    VALID.zip(VALID)
  end
end
