# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  dob        :date
#  photo      :string(255)
#  bio        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :string(255)
#

class Artist < ActiveRecord::Base
  belongs_to :album
  attr_accessible :bio, :dob, :name, :photo, :album_id
end
