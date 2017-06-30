class SessionsController < ApplicationController
  def create
    if user = User.authenticate(session_params)
      session[:user_id] = user.id
      redirect_to "/"
    else
      @error = "Incorrect login"
      render "new"
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to "/"
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end