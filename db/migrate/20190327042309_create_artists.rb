class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.datetime :date_of_birth
      t.integer :begin_year
      t.datetime :end_date
      t.string :website
      t.string :picture

      t.timestamps
    end
  end
end
