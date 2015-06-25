# == Schema Information
#
# Table name: facet_leafs
#
#  id         :integer          not null, primary key
#  facet_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FacetLeaf < ActiveRecord::Base
  # Appartient a 
  belongs_to :facets
  # A plusieurs
  has_many :headings
  # Doit être unique
  validates :facet_id, :uniqueness => true
end
