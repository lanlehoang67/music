class CreateHistorySongs < ActiveRecord::Migration[5.2]
  def change
    create_table :history_songs do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
