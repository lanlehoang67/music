class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_song, only: :create

  def create
    return unless params[:comment]
    @song.comments.build user_id: current_user.id, text: params[:comment]
    @song.save
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
