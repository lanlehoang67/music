class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthabl
  has_many :user_favorites
  has_many :notifications
  has_many :play_lists
  has_many :songs, through: :user_favorites
  has_many :upload_songs, class_name: Song.name, foreign_key: "user_id"
  has_many :comments
  has_many :history_songs
  has_many :h_songs, through: :history_songs, source: "song"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :picture, PictureUploader
  def fav target
    if target.class.name == "Song"
      self.user_favorites.build(favorite_type_id: target.genres[0].id, favorite_id: target.id).save

    else
      self.user_favorites.build(favorite_id: target.id).save
    end
  end

  def un_fav target
    self.user_favorites.find_by(favorite_id: target.id).destroy
  end

  def add_notify target
    if target.class.name == "Song"
      self.notifications.build(user_favorite_id: target.user_favorites.last.id, title: "User #{self.full_name} has added #{target.title} to favorites!").save
    else
      self.notifications.build(user_favorite_id: target.user_favorites.last.id, title: "User #{self.full_name} has added #{target.name} to favorites!").save
    end
  end

  def del_notify target
    if target.class.name == "Song"
      self.notifications.build(user_favorite_id: target.user_favorites.last.id, title: "User #{self.full_name} has removed #{target.title} from favorites!").save
    else
      self.notifications.build(user_favorite_id: target.user_favorites.last.id, title: "User #{self.full_name} has removed #{target.name} from favorites!").save
    end
  end
end
