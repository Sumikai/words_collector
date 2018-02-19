class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(word_id: params[:word_id])
    @words = favorite
    redirect_to words_path
  end

  def destroy
    favorite = current_user.favorites.find_by(word_id: params[:word_id]).destroy
    redirect_to word_path
  end
end
