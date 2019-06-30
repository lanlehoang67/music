class Song < ApplicationRecord
	has_many :user_favorites, foreign_key: "favorite_id"
  has_many :song_genres
	has_many :genres, through: :song_genres
  has_many :comments
	belongs_to :artist
  belongs_to :user
  belongs_to :play_list, optional: true
  belongs_to :album
  delegate :name, to: :artist, prefix: true
  scope :top, ->{all.order(views: :desc).limit(10)}
  scope :recent, ->{all.order(created_at: :desc).limit(10)}
  scope :find_by_genre, ->(genre_to_find){joins(:genres).where("genres.title = ?",genre_to_find)}
  scope :find_by_country, ->(country_to_find){where("songs.country = ?",country_to_find)}
  scope :trending, ->{all.order(views: :desc).limit(10)}
  mount_uploader :picture, PictureUploader
  mount_uploader :url, PictureUploader
end
