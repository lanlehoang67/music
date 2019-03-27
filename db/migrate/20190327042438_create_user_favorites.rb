class CreateUserFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorites do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
