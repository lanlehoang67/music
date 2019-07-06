class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :picture
      t.text :venue
      t.string :phone_number
      t.string :email
      t.text :description
      t.boolean :paid
      t.string :price
      t.integer :time, limit: 8
      t.timestamps
    end
  end
end
