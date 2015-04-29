# == Schema Information
#
# Table name: recitals
#
#  id         :integer          not null, primary key
#  clause     :string
#  prefix     :string
#  bill_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Recital < ActiveRecord::Base
  before_validation :set_defaults

  belongs_to :bill

  validates :clause,  presence: true
  validates :bill_id, presence: true

  private

  def set_defaults
    self.prefix ||= 'Whereas'
  end
end
