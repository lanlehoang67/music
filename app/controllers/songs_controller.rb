class SongsController < ApplicationController
  before_action :load_song, :load_comments, only: [:show]
  before_action :load_genres, :load_songs, only: [:index]
  def index
    respond_to do |f|
      f.html
      f.js
    end
  end

  def show
    @comment = Comment.new
    respond_to do |f|
      f.html
      f.js
    end
  end

  def create
  end

  private

  def load_song
    @song = Song.find_by id: params[:id]
    return if @song
    flash[:danger] = "cannot find song"
    redirect_to root_path
  end

  def load_comments
    if params[:page]
      @comments = @song.comments.newest.page(params[:page])
    else
      @comments = @song.comments.newest.page(1)
    end
  end

  def load_songs
    @songs = Song.all.page params[:page]
  end

  def load_genres
    @genres = Genre.all
  end

  def add_user_favorites
    UserFavorite.new
  end
end
