class RemoveFavoriteTypeIdFromUserFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_favorites, :favorite_type_id, :integer
  end
end
