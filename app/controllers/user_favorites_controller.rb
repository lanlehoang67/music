class UserFavoritesController < ApplicationController
  before_action :load_user, :load_song, only: [:create, :destroy]
  before_action :check_created, only: :create
  before_action :check_deleted, only: :destroy
  def create
  end

  def destroy
  end

  private

  def load_user
    @user = current_user
  end

  def load_song
    @song = Song.find_by id: params[:song_id]
  end

  def check_created
    if @user.fav @song
      @user.add_notify @song
      respond_to do |f|
        f.html {redirect_to song_path @song}
        f.js
      end
    else
      flash[:danger] = "cannot add to fav"
      redirect_to song_path @song
    end
  end

  def check_deleted
    if @user.un_fav @song
      @user.del_notify @song
      respond_to do |f|
        f.html {redirect_to song_path @song}
        f.js
      end
    else
      flash[:danger] = "cannot delete fav"
      redirect_to song_path @song
    end
  end
end
