class ChangePwdFieldUsers < ActiveRecord::Migration
  def change
    remove_column :users, :pwd
  end
end
