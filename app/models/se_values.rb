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

class SeValues < ActiveRecord::Base
  belongs_to :surrogate_element
  belongs_to :surrogates

  def self.search(query)
    where("value like ?", "%#{query}%")
  end

end
