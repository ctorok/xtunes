class AddAlbumsArtistsTable < ActiveRecord::Migration
  def  change
    create_table :albums_artists, :id => false do |t|
      t.integer :album_id
      t.integer :artist_id
    end
  end
end
