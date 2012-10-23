class AddAudioFileToSongs < ActiveRecord::Migration
  def change
     add_column :songs, :audiofile, :string
  end
end
