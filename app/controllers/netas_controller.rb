class NetasController < ApplicationController
  before_action :set_neta, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :edit, :show]

  def new
    if params[:back]
      @neta = Neta.new(neta_params)
    else
      @neta = Neta.new
    end
  end

  def create
    @neta = Neta.create(neta_params)
    @neta.user_id = current_user.id
    if @neta.save
      redirect_to netas_path, notice: '投稿しました'
    else
      render 'new'
    end
  end

  def confirm
    @neta = Neta.new(neta_params)
    @neta.user_id = current_user.id
    render :new if @neta.invalid?
  end

  def show
    @neta = Neta.find(params[:id])
    @favorite = current_user.favorites.find_by(neta_id: @neta.id)
  end

  def edit
    @neta = Neta.find(params[:id])
  end

  def update
    @neta = Neta.find(params[:id])
    if @neta.update(neta_params)
      redirect_to user_path(current_user.id), notice: '投稿を更新しました'
    else
      render 'edit'
    end
  end

  def index
    @netas = Neta.all
    @search = Neta.ransack(params[:q])
    if params[:q].nil?
      @results = nil
    else
      @results = @search.result
    end
  end

  def destroy
    @neta.destroy
    redirect_to netas_path, notice: '投稿を削除しました'
  end

  private
  def neta_params
    params.require(:neta).permit(:neta_name, :source, :impression)
  end

  def set_neta
    @neta = Neta.find(params[:id])
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path
    end
  end

end
