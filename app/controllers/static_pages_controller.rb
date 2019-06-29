class StaticPagesController < ApplicationController
  before_action :load_top_songs, :load_recent_song, :load_trending_song, 
  :load_featured_artist, :load_japan_song, :load_movie_song,
  :load_genres


  def home
  end

  private

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

  def load_playlist
    @playlists = current_user.playlists
  end

  def load_japan_song
    @japan_songs = Song.find_by_genre "japan"
  end

  def load_movie_song
    @movie_songs = Song.find_by_genre "movie"
  end

  def load_genres
    @genres = Genre.all
  end
end