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
  belongs_to :facets
  has_many :headings
  validates :facet_id, :uniqueness => true
end
