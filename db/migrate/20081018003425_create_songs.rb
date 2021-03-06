class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.integer :artist_id, :album_id
      t.integer :track
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
