class Attachment < ActiveRecord::Base
  belongs_to :legislation, touch: true
  has_attached_file :file

  validates_with AttachmentSizeValidator, :attributes => :file,
                 :less_than => 1.megabytes
  validates_attachment_content_type :file, content_type: %w{ image/jpg image/jpeg image/png image/gif }
end
