class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      NetaMailer.neta_mail(@user).deliver
      redirect_to new_session_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: 'プロフィールを更新しました'
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @netas = @user.netas
    @favorites_netas = @user.favorite_netas
  end

  def index
    @users = User.all
  end

  def destroy
    User.find_by(id: params[:user_id]).destroy
    redirect_to new_user_path, notice: '退会しました'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :image, :sex, :age, :favorite_rakugoka, :year_of_experience)
  end

end
