class RemoveUserIdFromPlayList < ActiveRecord::Migration[5.2]
  def change
    remove_column :play_lists, :user_id, :integer
  end
end
