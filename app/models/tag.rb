# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string
#  taggings_count :integer          default(0)
#

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :surrogates
  validates :tag_name, :uniqueness => true
end
