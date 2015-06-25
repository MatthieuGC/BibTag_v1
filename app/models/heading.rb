# == Schema Information
#
# Table name: headings
#
#  id            :integer          not null, primary key
#  heading_name  :string
#  facet_leaf_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  abbreviation  :string
#

class Heading < ActiveRecord::Base
  # Appartient a
  belongs_to :facet_leafs
  # A plusieurs et appartient à 
  has_and_belongs_to_many :surrogates
  # Doit être unique
  validates :heading_name, :uniqueness => true
end
