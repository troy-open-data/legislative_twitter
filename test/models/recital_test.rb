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

class RecitalTest < ActiveSupport::TestCase
  context 'a valid recital' do
    should 'belong to a bill' do
      assert should_belong_to Recital, :bill
    end
    should 'require a clause' do
      assert should_validate_presence_of :clause, :recital
    end

    should 'have a default prefix of \'Whereas\'' do
      recital = build(:recital, prefix: nil)
      recital.save!

      assert_equal 'Whereas', recital.prefix
    end
  end
end
