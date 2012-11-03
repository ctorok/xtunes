# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  price_paid :decimal(, )
#  user_id    :string(255)
#  song_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Purchase < ActiveRecord::Base
  attr_accessible :price_paid, :song_id, :user_id
  belongs_to :user #will have its ID
  belongs_to :song #will have its ID
  # validates :price_paid, :numericality => true

end
