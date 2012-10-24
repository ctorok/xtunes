# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  pwd        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  u_type     :string(255)
#

class User < ActiveRecord::Base
  has_many :songs, :through => :purchases
  attr_accessible :email, :name, :pwd, :u_type
   validates :u_type, :length => { :maximum => 1 }
   # validate :u_type, :format => { :with => /\A[avuAVU]\z/, :message => "Can only be A(dmin), V(isitor) or U(ser)" } =====> do later - not working
end
