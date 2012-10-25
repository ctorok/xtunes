class ChangeAlbumYearType < ActiveRecord::Migration
  def change
    remove_column :albums, :year
    add_column :albums, :year, :integer
  end
end
