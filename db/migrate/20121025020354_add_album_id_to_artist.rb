class AddAlbumIdToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :album_id, :string
  end
end
