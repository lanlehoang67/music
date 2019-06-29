class PlayList < ApplicationRecord
  has_many :play_list_songs
  has_many :songs, through: :play_list_songs
  belongs_to :user, optional: true
  mount_uploader :picture, PictureUploader
  scope :for_public, ->(){where(user_id: nil)}
end
