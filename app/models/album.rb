class Album < ApplicationRecord
	has_many :user_favorites
	has_many :songs
	belongs_to :artist
	mount_uploader :picture, PictureUploader
end
