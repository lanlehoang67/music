class StaticPagesController < ApplicationController
  before_action :load_hot_songs, :load_genres
  def home
  end

  private

  def load_hot_songs
    @songs = Song.high_views
  end

  def load_genres
    @categories = Genre.take(4)
  end
end
