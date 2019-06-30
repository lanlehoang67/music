class AddLyricToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :lyric, :string
  end
end
