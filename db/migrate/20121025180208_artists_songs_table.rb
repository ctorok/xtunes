class ArtistsSongsTable < ActiveRecord::Migration
   def  change
    create_table :artists_songs, :id => false do |t|
      t.integer :song_id
      t.integer :artist_id
  end
  end
end
