# == Schema Information
#
# Table name: se_values
#
#  id                   :integer          not null, primary key
#  value                :string
#  surrogate_element_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class SeValue < ActiveRecord::Base
end
