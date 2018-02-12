class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(neta_id: params[:neta_id])
    redirect_to netas_url, notice: "#{favorite.neta.user.name}さんの投稿にいいねしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(neta_id: params[:neta_id]).destroy
    redirect_to netas_url, notice: "#{favorite.neta.user.name}さんの投稿へのいいねをはずしました"
  end
end
