class UserFavorite < ApplicationRecord
	belongs_to :user
	belongs_to :song,  optional: true
	belongs_to :album,  optional: true
end
