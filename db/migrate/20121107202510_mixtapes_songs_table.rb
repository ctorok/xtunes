class MixtapesSongsTable < ActiveRecord::Migration
  def  change
    create_table :mixtapes_songs, :id => false do |t|
      t.integer :song_id
      t.integer :mixtape_id
    end
  end
end
