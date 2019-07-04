class ApplicationController < ActionController::Base
  # rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  # rescue_from ::NameError, with: :error_occurred
  # rescue_from ::ActionController::RoutingError, with: :error_occurred
  # # rescue_from ::Exception, with: :error_occurred
  before_action :load_playlist, :load_recent_song, :load_trending_song
 skip_before_action :verify_authenticity_token
  respond_to :html, :json, :js
  # protected
  def load_playlist
    @playlist = PlayList.find_by id: session[:url]
    return unless @playlist
    @pl_songs = @playlist.songs
  end
  # def record_not_found(exception)
  #   render json: {error: exception.message}.to_json, status: 404
  #   return
  # end
    def load_recent_song
    @recent_songs = Song.recent
  end

  def load_trending_song
    @trending_songs = Song.trending
  end
  # def error_occurred(exception)
  #   render json: {error: exception.message}.to_json, status: 500
  #   return
  # end

  def search
    @songs = Song.ransack(title_cont: params[:q]).result(distinct: true)
    respond_to do |f|
      f.html {}
      f.json {
        @songs = @songs.limit(5)
      }
    end
  end

end
