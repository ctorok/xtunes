# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  year       :integer
#

class Album < ActiveRecord::Base
  attr_accessible :name, :photo, :year, :genre_ids, :artist_ids

  has_and_belongs_to_many :artists
  has_and_belongs_to_many :genres

end
