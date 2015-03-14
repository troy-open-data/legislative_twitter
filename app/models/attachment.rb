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

class Attachment < ActiveRecord::Base
  belongs_to :legislation, touch: true
  has_attached_file :file

  validates_attachment :file, presence: true,
                       size: { less_than: 1.megabytes },
                       content_type: { content_type: %w{ image/jpg image/jpeg image/png image/gif application/pdf }}
end
