# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  rating      :integer
#  is_favorite :boolean
#  price       :float
#  photo       :string(255)
#  lyrics      :string(255)
#  audio       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Song < ActiveRecord::Base
  attr_accessible :name, :price, :audiofile
  mount_uploader :audiofile, AudiofileUploader
end
