# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  pwd             :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_type       :string(255)
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :pwd, :user_type, :password_confirmation

  has_many :songs, :through => :purchases
  
  has_secure_password
  
  validates :user_type, :length => { :maximum => 1 }
   # validate :user_type, :format => { :with => /\A[avuAVU]\z/, :message => "Can only be A(dmin), G(uest) or U(ser)" } =====> do later - not working
  validates_uniqueness_of :email
  validates_presence_of :email
end
