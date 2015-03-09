# == Schema Information
#
# Table name: legislations
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Legislation < ActiveRecord::Base
  paginates_per 5

  def created_at_time
    created_at.strftime('Added %B %d, %Y')
  end
end
