class RemoveFavoriteTypeFromSong < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :favorite_type, :string
  end
end
