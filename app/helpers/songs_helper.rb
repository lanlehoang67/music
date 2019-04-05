module SongsHelper
  def check_comment comment
    return ("<img src='../assets/"+comment.user_picture+"'/>").html_safe if comment.user_picture
    "<img src='../assets/avatar.png'/>".html_safe
  end

  def load_genres song
    return song.genres[0].title if song.genres.any?
    "No Genre"
  end

  def load_lyrics song
    return song.lyrics.first.text if song.lyrics.any?
    "No lyrics yet"
  end
end
