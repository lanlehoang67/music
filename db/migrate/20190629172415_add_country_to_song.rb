class AddCountryToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :country, :string
  end
end
