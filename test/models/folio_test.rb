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
  # test "the truth" do
  #   assert true
  # end
end
