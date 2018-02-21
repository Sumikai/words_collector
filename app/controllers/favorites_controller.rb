class FavoritesController < ApplicationController
  def toggle
    word_id = params[:word_id]
    user_favorites = current_user.favorites
    if user_favorites.exists?(word: word_id)
      user_favorites.where(word: word_id).destroy_all
    else
      user_favorites.create(user: current_user, word: Word.find(word_id))
    end
    head :ok
  end
  
  #def create
   # favorite = current_user.favorites.create(word_id: params[:word_id])
    #@words = favorite
    #redirect_to words_path
  #end

  #def destroy
    #favorite = current_user.favorites.find_by(word_id: params[:word_id]).destroy
    #redirect_to word_path
  #end
end
