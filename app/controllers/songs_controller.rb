class SongsController < ApplicationController
  before_action :load_song, :load_playlist, :load_playlists, :load_comments, only: :show

  def show
    @comment = Comment.new
  end

  private

  def load_song
    @song = Song.find_by id: params[:id]
  end

  def load_playlist
    @playlist = PlayList.new
  end

  def load_playlists
    @playlists = current_user ? current_user.play_lists : nil
  end

  def load_comments
    @comments = @song.comments.newest.page params[:page]
  end

  def load_album_songs
    @album_songs = @song.album.songs
  end
end
