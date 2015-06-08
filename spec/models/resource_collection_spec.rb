# == Schema Information
#
# Table name: resource_collections
#
#  id              :integer          not null, primary key
#  collection_name :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

require 'rails_helper'

RSpec.describe ResourceCollection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
