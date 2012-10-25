class RemoveAlbumIdFieldFromSongsAndArtistsTables < ActiveRecord::Migration
  def change
    remove_column :songs, :album_id
    remove_column :artists, :album_id
  end
end
