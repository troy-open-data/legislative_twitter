class Legislation < ActiveRecord::Base

  def created_at_time
    created_at.strftime('Added %B %d, %Y')
  end
end
