class SongsController < ApplicationController
  before_action :load_song, :load_comments, only: [:show]
  def index
  end

  def show
    @comment = Comment.new
  end

  private

  def load_song
    @song = Song.find_by id: params[:id]
    return if @song
    flash[:danger] = "cannot find song"
    redirect_to root_path
  end

  def load_comments
    @comments = @song.comments.page params[:page]
  end
end
