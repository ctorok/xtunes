class ChangeTypeUserFieldName < ActiveRecord::Migration
  def change
    remove_column :users, :type
    add_column :users, :u_type, :string
  end
end
