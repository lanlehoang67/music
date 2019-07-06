class SongsController < ApplicationController
  before_action :load_song, :load_playlist, :load_playlists, :load_comments, only: :show
  before_action :load_songs, only: :index
  def index
  end

  def new
  end

  def create
    @song_to_create = Song.new title: params[:name], picture: params[:image], url: params[:file], album_id: 3, user_id: current_user.id
    @artist_to_check = Artist.find_by name: params[:artist]
    if @artist_to_check.nil?
      @new_artist = Artist.new name: params[:name]
      if @new_artist.save
        @song_to_create.artist_id = @new_artist.id
        if @song_to_create.save
          respond_to do |f|
            byebug
            f.js {render js: "$.notify('created successfully','success')"}
          end
        else 
          respond_to do |f|
            f.js {render js: "$.notify('cannot create song','error')"}
          end
        end
      else
        respond_to do |f|
          f.js {render js: '$.notify("cannot create artist","error")'}
        end
      end
    else 
      @song_to_create.artist_id = @artist_to_check.id
      if @song_to_create.save
        respond_to do |f|
                      byebug

            f.js {render js: "$.notify('created successfully','success')"}
          end
      else

        respond_to do |f|
          f.js {render js: "$.notify('cannot create song','error')"}
        end
      end
    end
  end

  def show
    @comment = Comment.new
  end

  private

  def load_song
    @song = Song.find_by id: params[:id]
  end

  def load_songs
    @songs = Song.all.page params[:page]
  end

  def load_playlist
    @playlist = PlayList.new
  end

  def load_playlists
    @playlists = current_user ? current_user.play_lists : nil
  end

  def load_comments
    @comments = @song.comments.newest.page params[:page]
  end

  def load_album_songs
    @album_songs = @song.album.songs
  end
end
