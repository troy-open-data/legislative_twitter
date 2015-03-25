# == Schema Information
#
# Table name: folios
#
#  id             :integer          not null, primary key
#  meeting_id     :integer
#  legislation_id :integer
#  notes          :text
#  vote           :string
#  sponsor        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class FolioTest < ActiveSupport::TestCase
  setup do
    assert @folio = create(:folio)
  end

  # Associations
  test 'belongs to one legislation' do
    assert @folio.respond_to? :legislation
  end
  test 'belongs to one meeting' do
    assert @folio.respond_to? :meeting
  end
end
