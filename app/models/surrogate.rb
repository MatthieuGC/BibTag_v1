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

class Surrogate < ActiveRecord::Base
end
