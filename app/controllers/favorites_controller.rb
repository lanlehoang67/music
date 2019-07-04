class FavoritesController < ApplicationController
  before_action :load_favorites, only: :index
  def index
  end

  def create
  	if params[:song_id]
  		@user_fav = UserFavorite.new user_id: current_user.id, favorite_id: params[:song_id]
  		if @user_fav.save 
  			respond_to do |format|
  				format.js {render action: "create"}
  			end
  		else 
  			respond_to do |format|
  				format.js {render action: "error"}
  			end
  		end
  	end
  end

  def destroy
  	if params[:id]
  		@fav_to_destroy = UserFavorite.find_by favorite_id: params[:id]
  		if @fav_to_destroy.destroy 
  			respond_to do |f|
  				f.js
  			end
  		else 
  			respond_to do |f|
  				f.js {render action: "destroy_error"}
  			end
  		end
  	end
  end

  private 

  def load_favorites 
  	@favorite_songs = current_user ? current_user.songs : nil
  end
end
