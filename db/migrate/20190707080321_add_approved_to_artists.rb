class AddApprovedToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :approved, :boolean
  end
end
