class PlayListSongsController < ApplicationController
  before_action :load_playlist, :load_songs, only: :create
  def create
  end

  def destroy

  end

  private

  def load_playlist
    @playlist = PlayList.find_by id: params[:id]
  end

  def load_songs
    @songs = @playlist.songs
  end
end
