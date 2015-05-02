# == Schema Information
#
# Table name: recitals
#
#  id         :integer          not null, primary key
#  clause     :string
#  prefix     :string
#  bill_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

# Recital model unit tests
class RecitalTest < ActiveSupport::TestCase
  should belong_to(:bill)

  should validate_presence_of(:clause)
  context 'a valid recital' do
    should 'have a default prefix of \'Whereas\'' do
      recital = build(:recital, prefix: nil)
      recital.save!
      assert_equal 'Whereas', recital.prefix
    end
  end
end
