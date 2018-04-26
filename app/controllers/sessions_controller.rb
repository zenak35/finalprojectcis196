class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    session[:user_id] = @user.id if @user && @user.password == params[:password]
    redirect_to root_path if @user && @user.password == params[:password]
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
