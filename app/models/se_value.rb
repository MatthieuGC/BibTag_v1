# == Schema Information
#
# Table name: se_values
#
#  id                   :integer          not null, primary key
#  value                :string
#  surrogate_element_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  surrogate_id         :integer
#

class SeValue < ActiveRecord::Base
  # Appartient a
  belongs_to :surrogate_element
  belongs_to :surrogates

  # Fonction de recherche de terme pour le "searching"
  def self.search(query)
    where("value like ?", "%#{query}%")
  end

end
