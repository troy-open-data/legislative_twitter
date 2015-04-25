# == Schema Information
#
# Table name: people
#
#  id         :integer          not null, primary key
#  first      :string
#  last       :string
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Person < ActiveRecord::Base
  validates :first, presence: true
  validates :last,  presence: true

  has_many :memberships,    dependent: :destroy
  has_many :organizations,  through: :memberships

  has_many :sponsorships,   dependent: :destroy
  has_many :folios,         through: :sponsorships

  has_many :attendances,    dependent: :destroy
  has_many :meetings,       through: :attendances

  def name
    "#{first} #{last}"
  end
end
