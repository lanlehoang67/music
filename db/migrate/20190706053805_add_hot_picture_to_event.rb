class AddHotPictureToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :hot_picture, :string
  end
end
