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



  protected

  # Called before this object is saved to the DB
  # Called from the Controller
  def already_purchased
    #check if song and user together exist in the table
    raise params.inspect
    u = Purchase.where("user_id = ?", session[:user_id])
    s = Purchase.where("song_id = ?", params[:song_id])
    if u == @purchase.user_id && s == @purchase.song_id
       redirect_to songs_path, :notice => "You have already purchased this song!"
    end
  end

end
