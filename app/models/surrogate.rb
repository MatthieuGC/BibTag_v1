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
  # Peut être taggué
  acts_as_taggable_on :tags
  # Appartient a
  belongs_to :resource_collections
  # A plusieurs et appartient a
  has_and_belongs_to_many :headings
  # A plusieurs
  has_many :surrogate_elements, :dependent => :destroy
  has_many :se_values
  has_many :keywords, :dependent => :destroy
  # Les champs suivant ne doivent pas être vide ou null
  validates :entry_type, :presence => true
  validates :entry_key, :presence => true

  # Fonction de recherche de terme pour le "searching"
  def self.search(query)
    where("entry_key like ?", "%#{query}%")
  end

end
