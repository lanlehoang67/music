class StaticPagesController < ApplicationController
  before_action :load_top_songs, :load_recent_song, :load_trending_song,
  :load_featured_artist, :load_movie_song,
  :load_genres, :load_playlists


  def home
    @japan_songs = load_country_song "Japan"
    @china_songs = load_country_song "China"
    @playlist = PlayList.new
  end

  private

  def load_country_song country
    @songs_by_country = Song.find_by_country country
  end

  def load_top_songs
    @top_songs = Song.top
  end

  def load_recent_song
    @recent_songs = Song.recent
  end

  def load_trending_song
    @trending_songs = Song.trending
  end

  def load_featured_artist
    @featured_artists = Artist.take(10)
  end

  def load_playlists
    @playlists = current_user ? current_user.play_lists : nil
  end

  def load_movie_song
    @movie_songs = Song.find_by_genre "movie"
  end

  def load_genres
    @genres = Genre.all
  end
end
