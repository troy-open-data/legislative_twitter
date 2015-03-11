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
  has_paper_trail
  paginates_per 5

  def created_at_time
    created_at.strftime('Added %B %d, %Y')
  end

  def list_changed_attributes(version)
    diff_attributes(version).join(", ")
  end

  # Relating to versioning and diffs
  def diff_attributes(version=versions.last)
    ignored_changes = %w{ created_at updated_at id }
    version.changeset.keys - ignored_changes
  end
end
