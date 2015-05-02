# == Schema Information
#
# Table name: attachments
#
#  id                :integer          not null, primary key
#  bill_id           :integer
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
  should belong_to(:bill)

  should have_attached_file(:file)
  should validate_attachment_presence(:file)
  should validate_attachment_content_type(:file)
         .allowing(Attachment::VALID_FILETYPES)
  should validate_attachment_size(:file)
         .less_than(1.megabyte)
end
