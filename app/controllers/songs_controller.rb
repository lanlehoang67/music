class SongsController < ApplicationController
  before_action :load_song, :load_comments, only: :show

  def show
    @comment = @song.comments.new
  end

  private

  def load_song
    @song = Song.find_by id: params[:id]
  end

  def load_comments
    @comments = @song.comments
  end

  def load_album_songs
    @album_songs = @song.album.songs
  end
end
