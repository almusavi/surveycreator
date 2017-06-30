class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :new_user
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @users_games = @user.games
  end

  def index
    @users = User.search(params[:search])
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end