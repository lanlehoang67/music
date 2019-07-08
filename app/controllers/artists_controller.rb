class ArtistsController < ApplicationController
  before_action :load_artists, only: :index
  before_action :load_artist, :load_songs, :load_albums, only: :show
  def index
  end

  def show
  end

  private 

  def load_artists
  	@artists = Artist.select_approved
  end

  def load_artist
  	@artist = Artist.find_by id: params[:id]
  end

  def load_songs
  	@songs = @artist.songs
  end

  def load_albums
  	@albums = @artist.albums
  end
end
