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
  def self.search(query)
    where("value like ?", "%#{query}%")
  end
end
