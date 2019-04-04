class AddPictureToGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :picture, :string
  end
end
