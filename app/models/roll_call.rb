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

class RollCall < ActiveRecord::Base
  TYPES = %w(Pass CallTheQuestion Table)

  belongs_to :motion
  has_many :votes,              dependent: :destroy
  accepts_nested_attributes_for :votes,
                                reject_if: ->(attr) { attr[:vote].blank? },
                                allow_destroy: true

  validates :type, inclusion: TYPES
  before_validation :set_defaults

  # no single table inheritance
  self.inheritance_column = nil

  # Provides values and names for the select form helper
  # @return [Array<Array>]
  #   [[Pass, Pass], [Call the question, CallTheQuestion], [Table, Table]]
  def self.select_text
    TYPES.map { |t| t.underscore.humanize }.zip(TYPES)
  end

  # @return[String] 'Passed' or 'Failed'
  def result
    passed ? 'Passed' : 'Failed'
  end

  private

  def set_defaults
    self.type ||= 'Pass'
  end
end
