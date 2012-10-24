# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  audiofile  :string(255)
#  album_id   :string(255)
#

class Song < ActiveRecord::Base
  has_many :users, :through => :purchases
  has_many :artists
  belongs_to :album
  attr_accessible :name, :price, :audiofile, :album_id
  mount_uploader :audiofile, AudiofileUploader
end
