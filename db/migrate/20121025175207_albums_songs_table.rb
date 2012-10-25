class AlbumsSongsTable < ActiveRecord::Migration
  def  change
    create_table :albums_songs, :id => false do |t|
      t.integer :song_id
      t.integer :album_id
  end
  end
end
