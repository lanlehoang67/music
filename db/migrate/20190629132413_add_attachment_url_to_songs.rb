class AddAttachmentUrlToSongs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :songs do |t|
      t.attachment :url
    end
  end

  def self.down
    remove_attachment :songs, :url
  end
end
