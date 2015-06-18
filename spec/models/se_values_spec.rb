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

require 'rails_helper'

RSpec.describe SeValues, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
