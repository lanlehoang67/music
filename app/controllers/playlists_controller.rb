class PlaylistsController < ApplicationController
  before_action :authenticate_user!, :load_playlists
  def index
  end

  def post_song
    if request.xhr?
      session[:url] = params[:url]
    end
  end

  def get_songs
    @playlist = PlayList.find_by id: session[:url]
    respond_to do |f|
      f.json {render json: @playlist.songs}
    end
  end

  def create
  	@playlist = PlayList.new user_id: current_user.id, name: params[:play_list][:name]
    if @playlist.save
      respond_to do |f|
        f.js {render action: "create"}
      end
    end
  end

  private

  def load_playlists
  	@playlists = current_user.play_lists
  end

end
