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

class Keyword < ActiveRecord::Base
  belongs_to :surrogates
end
