class AddFavoriteTypeToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :favorite_type, :string
    add_index :songs, [:favorite_type, :favorite_id]
  end
end
