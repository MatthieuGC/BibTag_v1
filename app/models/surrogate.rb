# == Schema Information
#
# Table name: surrogates
#
#  id         :integer          not null, primary key
#  entry_type :string
#  entry_key  :string
#  doi        :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Surrogate < ActiveRecord::Base
  has_many :surrogate_elements, :dependent => :destroy
  has_many :keywords, :dependent => :destroy
  validates :entry_type, :presence => true
  validates :entry_key, :presence => true
end
