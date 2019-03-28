class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.references :artist, foreign_key: true
      t.string :url
      t.string :title
      t.string :content
      t.string :length
      t.integer :views
      t.references :album, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
