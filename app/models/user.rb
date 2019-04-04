class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthabl
  has_many :user_favorites
  has_many :songs, through: :user_favorites
  has_many :upload_songs, class_name: Song.name, foreign_key: "user_id"
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
