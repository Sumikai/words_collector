module FavoritesHelper
  def favorite_icon(word, user)
    if user
      if user.favorites.exists?(word: word)
        '<i class="fa fa-bookmark fa-2x"></i>'
      else
        '<i class="fa fa-bookmark fa-bookmark-o fa-2x"></i>'
      end
    end
  end
end
