class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.boolean :gender
      t.date :date_of_birth
      t.string :picture
      t.string :role

      t.timestamps
    end
  end
end
