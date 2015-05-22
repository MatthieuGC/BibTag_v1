# == Schema Information
#
# Table name: resource_collections
#
#  id              :integer          not null, primary key
#  collection_name :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ResourceCollection < ActiveRecord::Base
  has_many :surrogates
end
