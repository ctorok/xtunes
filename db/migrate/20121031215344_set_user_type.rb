class SetUserType < ActiveRecord::Migration
  def change
    remove_column :users, :admin
    remove_column :users, :is_user
    remove_column :users, :guest
    add_column :users, :user_type, :string
  end
end
