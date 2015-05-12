class Import < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # On utilise cet uploader pour ce model
end
