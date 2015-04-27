# == Schema Information
#
# Table name: folios
#
#  id         :integer          not null, primary key
#  meeting_id :integer
#  bill_id    :integer
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Folio < ActiveRecord::Base
  belongs_to :meeting
  belongs_to :bill

  has_many :sponsorships, dependent:  :destroy
  has_many :sponsors,     through:    :sponsorships,
                          source:     :person
  has_many :votes,        dependent:  :destroy
  has_many :voters,       through:    :votes,
                          source:     :person
  accepts_nested_attributes_for :votes,
                                reject_if: lambda { |attribute| attribute[:data].blank? },
                                allow_destroy: true


  def sponsors_list
    if sponsors.empty?
      'no recorded sponsors'
    else
      sponsors.collect(&:name).join(', ')
    end
  end
end
