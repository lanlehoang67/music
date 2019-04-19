class AddUserToPlayList < ActiveRecord::Migration[5.2]
  def change
    add_reference :play_lists, :user, foreign_key: true
  end
end
