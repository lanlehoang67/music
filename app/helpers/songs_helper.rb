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

  def check song_id, user_favorite_id
    if user_favorite_id
    href = "/songs/"+song_id.to_s+"/user_favorites/"+user_favorite_id.to_s
    byebug
     if current_user.user_favorites.empty?
       return('<a data-remote="true" rel="nofollow" data-method="post" href="<%= href %>">
                        <div class="show_fav_icon show_info_icon"><img class="svg" src="../assets/heart.svg" alt=""></div>
</a>').html_safe
     elsif current_user.user_favorites.any?
            return('<a data-remote="true" rel="nofollow" data-method="delete" href="<%= href %>">
                        <div class="show_fav_icon show_info_icon"><img class="svg" src="../assets/heart.svg" alt=""></div>
</a>').html_safe
     end
    else
      href = "/songs/"+song.id.to_s+"/user_favorites/1"
      return('<a data-remote="true" rel="nofollow" data-method="post" href="<%= href %>">
                        <div class="show_fav_icon show_info_icon"><img class="svg" src="../assets/heart.svg" alt=""></div>
</a>').html_safe
   end
  end

  def find_playlist name
    @playlist_add = PlayList.find_by name: name
  end
end
