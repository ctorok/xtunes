class AlbumsGenresTable < ActiveRecord::Migration
  def  change
    create_table :albums_genres, :id => false do |t|
      t.integer :album_id
      t.integer :genre_id
  end
  end
end
