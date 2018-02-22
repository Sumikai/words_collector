class FavoritesController < ApplicationController
  def bookmark
    word_id = params[:word_id]
    user_favorites = current_user.favorites
    if user_favorites.exists?(word: word_id)
      user_favorites.where(word: word_id).destroy_all
    else
      user_favorites.create(user: current_user, word: Word.find(word_id))
    end
    head :ok
  end
  
end
