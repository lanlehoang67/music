class AddAttachmentPictureToSongs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :songs do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :songs, :picture
  end
end
