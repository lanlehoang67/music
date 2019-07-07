class HistorySongsController < ApplicationController
  before_action :load_songs

  def index
  end

  def create
  	if params[:name]
  		@song = Song.find_by title: params[:name]
  		@history_song = HistorySong.new song_id: @song.id, user_id: current_user.id
 		@history_song.save
  	end
  end

  def destroy_all
  	@songs.destroy_all
  end

  private 

  def load_songs
  	@songs = current_user ? current_user.h_songs : nil
  end
end
