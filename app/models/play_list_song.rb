class PlayListSong < ApplicationRecord
  belongs_to :play_list
  belongs_to :song
  validates :song_id, uniqueness: true
end
