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

require 'rails_helper'

RSpec.describe SurrogateElement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end