class AddPictureToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :picture, :string
  end
end
