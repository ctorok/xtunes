class RemoveAlbumIdFromGenres < ActiveRecord::Migration
  def change
    remove_column :genres, :album_id
  end
end
