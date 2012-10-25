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
  belongs_to :album
  attr_accessible :name, :album_id
end
