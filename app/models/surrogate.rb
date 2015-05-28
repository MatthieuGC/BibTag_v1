# == Schema Information
#
# Table name: surrogates
#
#  id                     :integer          not null, primary key
#  entry_type             :string
#  entry_key              :string
#  doi                    :string
#  url                    :string
#  resource_collection_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Surrogate < ActiveRecord::Base
  acts_as_taggable_on :tags
  belongs_to :resource_collections
  has_many :surrogate_elements, :dependent => :destroy
  has_many :keywords, :dependent => :destroy
  validates :entry_type, :presence => true
  validates :entry_key, :presence => true
end
