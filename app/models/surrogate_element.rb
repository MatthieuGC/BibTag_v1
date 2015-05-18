# == Schema Information
#
# Table name: surrogate_elements
#
#  id           :integer          not null, primary key
#  name         :string
#  field        :string
#  arrayValues  :string
#  surrogate_id :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SurrogateElement < ActiveRecord::Base
  belongs_to :surrogate

  validates :name, :presence => true
  validates :field, :presence => true
  validates :arrayValues, :presence => true
  validates :surrogate_id, :presence => true
end
