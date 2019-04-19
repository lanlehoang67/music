class PlayListsController < ApplicationController
  before_action :load_playlist, :load_songs, only: :show
  before_action :load_playlists, only: :index

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
    if request.xhr?
      PlayList.create(name: params[:name], user_id: current_user.id)
    end
  end

  def destroy
  end

  def check_rq
    if params[:playlist]
      @playlist = PlayList.find_by name: params[:playlist]
      return unless @playlist
      @song = Song.find_by title: params[:song]
      @playlist.play_list_songs.build(play_list_id: @playlist.id, song_id: @song.id).save
    end
  end

  private

  def load_playlist
    @playlist = PlayList.find_by id: params[:id]
  end

  def load_songs
    @songs = @playlist.songs
  end

  def load_playlists
    @playlists = PlayList.for_public
  end
end
