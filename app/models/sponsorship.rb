# == Schema Information
#
# Table name: sponsorships
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  folio_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sponsorship < ActiveRecord::Base
  belongs_to :person
  belongs_to :motion
end
