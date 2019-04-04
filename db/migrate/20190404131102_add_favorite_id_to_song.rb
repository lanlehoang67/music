class AddFavoriteIdToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :favorite_id, :integer
  end
end
