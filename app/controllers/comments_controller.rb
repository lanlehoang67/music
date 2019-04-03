class CommentsController < ApplicationController
  before_action :set_attr_comment, :check_comment, only: [:create]
  before_action  :load_comment, :check_deleted, only: [:destroy]

  def create
  end

  def edit
  end

  def destroy
  end

  private

  def check_comment
    if @comment.save
      respond_to do |f|
        f.html {redirect_to song_path(id: @comment.song.id)}
        f.js
      end
    else
      flash[:error] = "cannot comment"
      redirect_to song_path(id: @comment.song.id)
    end
  end

  def set_attr_comment
    @comment = Comment.new comment_params
    @comment.user_id = current_user.id
    @comment.song_id = params[:song_id]
  end

  def comment_params
    params.require(:comment).permit :text
  end

  def check_deleted
    if @comment.destroy
      flash[:success] = "deleted successfully"
      respond_to do |format|
        format.html{redirect_to song_path(id: params[:song_id])}
        format.js
      end
    else
      flash[:error] = "delete failed"
      redirect_to song_path(id: params[:song_id])
    end
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment
    flash[:error] = "cannot find comment"
    redirect_to song_path(id: params[:song_id])
  end
end
