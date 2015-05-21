# == Schema Information
#
# Table name: surrogate_elements
#
#  id           :integer          not null, primary key
#  field_name   :string
#  surrogate_id :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SurrogateElement < ActiveRecord::Base
  has_many :se_values
  belongs_to :surrogate

  validates :field_name, :presence => true
  validates :surrogate_id, :presence => true
end
