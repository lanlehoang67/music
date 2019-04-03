module SongsHelper
  def check_comment comment
    if(comment.user_picture)
      ("<img src='../assets/"+comment.user_picture+"'/>").html_safe
    else
      "<img src='../assets/avatar.png'/>".html_safe
    end
  end
end
