class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.decimal :price_paid
      t.string :user_id
      t.string :song_id

      t.timestamps
    end
  end
end
