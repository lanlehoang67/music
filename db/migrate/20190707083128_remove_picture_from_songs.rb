class RemovePictureFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :picture, :string
  end
end
