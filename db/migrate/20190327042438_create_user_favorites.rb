class CreateUserFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorites do |t|
      t.references :user, foreign_key: true
      t.integer :favorite_type_id, limit: 8, null: false
      t.integer :favorite_id, limit: 8, null: false
      t.timestamps
    end
  end
end
