class AddAlbumIdToGenres < ActiveRecord::Migration
  def change
     add_column :genres, :album_id, :string
  end
end
