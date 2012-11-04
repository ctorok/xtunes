# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  price_paid :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  song_id    :integer
#  user_id    :integer
#

class Purchase < ActiveRecord::Base
  attr_accessible :price_paid, :song_id, :user_id
  belongs_to :user #will have its ID
  belongs_to :song #will have its ID
  # validates :price_paid, :numericality => true

end
