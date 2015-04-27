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
      should 'have many people (sponsors) through sponsorships' do
        assert should_have_many_through(Folio, :sponsors, :sponsorships)
      end
      should 'have many people (voters) through votes' do
        assert should_have_many_through(Folio, :voters, :votes)
      end
    end
  end

  context 'folio' do
    setup do
      @folio = create(:folio)
    end

    context '#sponsors' do
      context 'when there are no sponsors' do
        should 'return "no recorded sponsors"' do
          assert_equal 'no recorded sponsors', @folio.sponsors_list
        end
      end
      context 'when there are sponsors' do
        setup { @folio.sponsors << create(:person) }
        should 'contain sponsor names' do
          assert_match /#{@folio.sponsors[0].name}/, @folio.sponsors_list
        end
      end
    end
  end
end
