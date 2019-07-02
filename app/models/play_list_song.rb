class PlayListSong < ApplicationRecord
  belongs_to :play_list
  belongs_to :song
	  
  validate :check_song_uniqueness

  def check_song_uniqueness
  	playlist = PlayListSong.find_by(song_id: self.song_id, play_list_id: self.play_list.id)
  	errors.add(:playlist, "already has this song") if playlist.present?
  end
end
