# == Schema Information
#
# Table name: surrogate_elements
#
#  id          :integer          not null, primary key
#  name        :string
#  key         :string
#  arrayValues :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SurrogateElement < ActiveRecord::Base
end
