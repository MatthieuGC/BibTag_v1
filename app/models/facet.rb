# == Schema Information
#
# Table name: facets
#
#  id         :integer          not null, primary key
#  facet_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Facet < ActiveRecord::Base
  has_many :facet_leafs, :dependent => :destroy
  validates :facet_name, :uniqueness => true
end
