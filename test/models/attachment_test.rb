# == Schema Information
#
# Table name: attachments
#
#  id                :integer          not null, primary key
#  legislation_id    :integer
#  title             :string
#  description       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#

require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
