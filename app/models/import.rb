# == Schema Information
#
# Table name: imports
#
#  id             :integer          not null, primary key
#  attachment     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  collection_id  :integer
#  new_collection :string
#

class Import < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader # On utilise cet uploader pour ce model
end
