# == Schema Information
#
# Table name: resource_collections
#
#  id              :integer          not null, primary key
#  collection_name :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class ResourceCollection < ActiveRecord::Base
  # A plusieurs et appartient a
  has_and_belongs_to_many :surrogates, :dependent => :destroy
  has_and_belongs_to_many :users
end
