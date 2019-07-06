class AddApprovedToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :approved, :boolean
  end
end
