class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_song, only: :create

  def create
    return unless params[:comment]
    @song.comments.build user_id: current_user.id, text: params[:comment] 
    if @song.save
      @comments = @song.comments.newest.page params[:page]
      respond_to do |f|
        f.html
        f.js
      end
    else 
      render json: "error cannot create"
    end
  end

  def update
  end

  def destroy
  end

  private

  def load_song
    @song = Song.find_by id: params[:song_id]
  end
end
