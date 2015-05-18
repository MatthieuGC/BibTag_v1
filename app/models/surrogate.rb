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
  has_many :surrogate_elements, :dependent => :destroy
  has_many :keywords, :dependent => :destroy
  validates :name, :presence => true
end
