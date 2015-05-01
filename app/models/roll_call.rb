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
  belongs_to :motion
  has_many :votes,              dependent: :destroy
  accepts_nested_attributes_for :votes,
                                reject_if: ->(attr) { attr[:data].blank? },
                                allow_destroy: true

  before_validation :set_defaults

  require_dependency 'pass'
  require_dependency 'call_the_question'
  require_dependency 'table'

  def self.subclass_names
    self.subclasses.map { |klass| klass.model_name.name }
  end
  def self.subclass_human
    self.subclasses.map { |klass| klass.model_name.human }
  end

  # @return[String] 'Passed' or 'Failed'
  def result
    passed ? 'Passed' : 'Failed'
  end

  private

  def set_defaults
    self.type ||= Pass
  end
end
