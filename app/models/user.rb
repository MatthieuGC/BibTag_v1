# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nom        :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :nom, 
    :presence => true, 
    :length => { :maximum => 50 }
  validates :email, 
    :presence => true, 
    :format => { :with => email_regex },
    :uniqueness => { :case_sensitive => false }
end
