# == Schema Information
#
# Table name: headings
#
#  id            :integer          not null, primary key
#  heading_name  :string
#  facet_leaf_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  abbreviation  :string
#

require 'rails_helper'

RSpec.describe Heading, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
