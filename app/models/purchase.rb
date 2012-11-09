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

  before_save :already_purchased
  
  belongs_to :user #will have its ID
  belongs_to :song #will have its ID
  # validates :price_paid, :numericality => true

  def user_id_session
    return :no_such_item
  end

  def song_id_params
    return :no_such_item
  end

  def song_id_purchase
    return :no_such_item
  end

  def user_id_purchase
    return :no_such_item
  end

  protected

  # Called before this object is saved to the DB
  # Called from the Controller
  def already_purchased
    #check if song and user together exist in the table
    u = Purchase.where("user_id = ?", :user_id_session)
     # raise u.inspect
    s = Purchase.where("song_id = ?", :song_id_params)
    # raise s.inspect
    if u == :user_id_purchase && s == :song_id_purchase
       redirect_to songs_path, :notice => "You have already purchased this song!"
    end
  end

end
