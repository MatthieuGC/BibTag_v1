# == Schema Information
#
# Table name: surrogate_elements
#
#  id           :integer          not null, primary key
#  field_name   :string
#  surrogate_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SurrogateElement < ActiveRecord::Base
  # A plusieurs
  has_many :se_values, :dependent => :destroy
  # Appartient a
  belongs_to :surrogates
  
  # Les champs suivants ne doivent pas être vides ou null
  validates :field_name, :presence => true
  validates :surrogate_id, :presence => true
end
