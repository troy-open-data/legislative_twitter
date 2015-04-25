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
  ## Setup and Teardown ########################################################
  setup do
    @attachment = create(:attachment)
  end

  ## Associations ##############################################################
  test 'belongs to one bill' do
    @attachment.respond_to? :bill
  end
  test 'has attached file' do
    @attachment.respond_to? :file
  end

  ## Validations ###############################################################
  # test 'validates attachment presence'
  # test 'validates attachment size'
  # test 'validates attachment content type'
end
