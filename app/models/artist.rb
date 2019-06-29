class Artist < ApplicationRecord
	has_many :songs
	has_many :albums
	mount_uploader :picture, PictureUploader
end
