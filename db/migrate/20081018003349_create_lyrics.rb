class CreateLyrics < ActiveRecord::Migration
  def self.up
    create_table :lyrics do |t|
      t.integer :song_id, :user_id
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :lyrics
  end
end
