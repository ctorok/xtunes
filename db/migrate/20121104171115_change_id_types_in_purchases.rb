class ChangeIdTypesInPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :user_id
    remove_column :purchases, :song_id
    add_column :purchases, :song_id, :integer
    add_column :purchases, :user_id, :integer
  end
end
