class ChangeNameOfUtypeInUserTable < ActiveRecord::Migration
  def change
    remove_column :users, :u_type
    add_column :users, :user_type, :string
  end
end
