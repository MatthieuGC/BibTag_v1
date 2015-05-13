# == Schema Information
#
# Table name: surrogates
#
#  id         :integer          not null, primary key
#  name       :string
#  doi        :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Surrogate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
