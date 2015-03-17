# == Schema Information
#
# Table name: meetings
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  date            :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Meeting < ActiveRecord::Base
  # Model Relationships
  belongs_to :organization

  has_many :folios, dependent: :destroy
  has_many :meetings, through: :folios
  accepts_nested_attributes_for :folios,
                                allow_destroy: true
end
