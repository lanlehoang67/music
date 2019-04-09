class CreatePlayListSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :play_list_songs do |t|
      t.references :play_list, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
