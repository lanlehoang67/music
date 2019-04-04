class RemoveFavoriteIdFromSong < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :favorite_id, :integer
  end
end
