# == Schema Information
#
# Table name: snippets
#
#  id         :integer          not null, primary key
#  docket_id  :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SnippetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
