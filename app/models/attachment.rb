class Attachment < ActiveRecord::Base
  belongs_to :product
  #santo
  mount_uploader :file, AttachmentUploader
end
