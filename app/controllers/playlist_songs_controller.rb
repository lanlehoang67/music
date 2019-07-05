class PlaylistSongsController < ApplicationController
  before_action :authenticate_user!, :load_playlist, only: [:create, :destroy]
  def index
  end

  def create
    @playlist_song = @playlist.play_list_songs.build song_id: params[:song_id]
    if @playlist_song.save
      respond_to do |f|
        f.js
      end
    else
      respond_to do |f|
        f.js {render action: "error"}
      end
    end
  end

  def destroy
    @playlist_song = PlayListSong.find_by song_id: params[:id], play_list_id: params[:playlist_id]
    if @playlist_song.destroy
      render action: "destroy"
    else
      render js: "$.notify('error cannot remove','error')"
    end
  end

  private

  def load_playlist
    @playlist = PlayList.find_by id: params[:playlist_id]
  end
end
