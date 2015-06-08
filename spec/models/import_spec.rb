# == Schema Information
#
# Table name: imports
#
#  id             :integer          not null, primary key
#  attachment     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  collection_id  :integer
#  new_collection :string
#

require 'rails_helper'

RSpec.describe Import, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
