class PlaylistsController < ApplicationController
  before_action :load_playlists

  def index
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
