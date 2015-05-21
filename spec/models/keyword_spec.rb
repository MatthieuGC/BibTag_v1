# == Schema Information
#
# Table name: keywords
#
#  id           :integer          not null, primary key
#  keywordName  :string
#  surrogate_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Keyword, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
