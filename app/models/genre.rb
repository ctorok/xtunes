# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :string(255)
#

class Genre < ActiveRecord::Base
  attr_accessible :name
  has_many :albums
end
