# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  name           :string
#  taggings_count :integer          default(0)
#

class Tag < ActiveRecord::Base
  # A plusieurs et appartient a
  has_and_belongs_to_many :surrogates
  # Doit être unique
  validates :tag_name, :uniqueness => true
end
