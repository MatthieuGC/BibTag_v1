# == Schema Information
#
# Table name: facets
#
#  id         :integer          not null, primary key
#  facet_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Facet < ActiveRecord::Base
  # Appartient à
  belongs_to :users
  # A plusieurs
  has_many :facet_leafs, :dependent => :destroy
  has_many :headings
  # Doit être unique
  validates :facet_name, :uniqueness => true
end
