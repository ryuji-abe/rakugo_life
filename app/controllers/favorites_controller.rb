class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(neta_id: params[:neta_id])
    redirect_to netas_url, notice: "#{favorite.neta.user.name}さんのネタにいいねしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(neta_id: params[:neta_id]).destroy
    redirect_to netas_url, notice: "#{favorite.neta.user.name}さんのネタへのいいねをはずしました"
  end
end
