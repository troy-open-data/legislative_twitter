# == Schema Information
#
# Table name: people
#
#  id                     :integer          not null, primary key
#  first                  :string
#  last                   :string
#  bio                    :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

class Person < ActiveRecord::Base
  validates :first, presence: true
  validates :last,  presence: true

  has_many :memberships,    dependent: :destroy
  has_many :organizations,  through: :memberships

  has_many :sponsorships,   dependent: :destroy
  has_many :sponsored_bills,through: :sponsorships,
                            source: :folio

  has_many :votes,          dependent: :destroy

  has_many :attendances,    dependent: :destroy
  has_many :meetings,       through: :attendances

  def name
    "#{first} #{last}"
  end
end
