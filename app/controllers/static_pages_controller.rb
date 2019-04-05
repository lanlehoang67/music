class StaticPagesController < ApplicationController
  before_action :load_hot_songs, :load_genres
  def home
    # if params[:song].present?
    #   @songs = Song.find_by(title: params[:song])
    # end
    # if request.xhr?
    #   respond_to do |format|
    #     format.json {
    #       render json: {songs0: @songs}
    #     }
    #   end
    # end
  end

  private

  def load_hot_songs
    @songs = Song.high_views
  end

  def load_genres
    @categories = Genre.take(4)
  end
end
