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

require 'test_helper'

class FolioTest < ActiveSupport::TestCase
  context 'a valid folio' do
    setup do
      @folio = create(:folio)
    end

    context 'with associations' do
      should 'belong to a bill' do
        assert should_belong_to(Folio, :bill)
      end
      should 'belong to a meeting' do
        assert should_belong_to(Folio, :meeting)
      end
      should 'have many people through sponsorships' do
        assert should_have_many_through(Folio, :people, :sponsorships)
      end
    end
  end
end
