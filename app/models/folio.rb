# == Schema Information
#
# Table name: folios
#
#  id         :integer          not null, primary key
#  meeting_id :integer
#  bill_id    :integer
#  notes      :text
#  vote       :string
#  sponsor    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Folio < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :bill

  has_many :sponsorships, dependent:  :destroy
  has_many :sponsors,     through:    :sponsorships,
                          source:     :person


  def sponsors_list
    if sponsors.empty?
      'no recorded sponsors'
    else
      sponsors.collect(&:name).join(', ')
    end
  end
end
