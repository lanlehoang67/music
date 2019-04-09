class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthabl
  has_many :user_favorites
  has_many :songs, through: :user_favorites
  has_many :upload_songs, class_name: Song.name, foreign_key: "user_id"
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
end
