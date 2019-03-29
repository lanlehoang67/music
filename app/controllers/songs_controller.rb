class SongsController < ApplicationController
  before_action :load_song, only: [:show]
  def index
  end

  def show
  end

  private

  def load_song
    @song = Song.find_by id: params[:id]
    return if @song
    flash[:danger] = "cannot find song"
    redirect_to root_path
  end
end
