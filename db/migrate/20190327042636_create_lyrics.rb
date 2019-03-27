class CreateLyrics < ActiveRecord::Migration[5.2]
  def change
    create_table :lyrics do |t|
      t.float :start
      t.string :text
      t.float :end
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
