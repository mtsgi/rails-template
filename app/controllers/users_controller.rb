class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user].permit(:name, :password, :password_confirmation, :email)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      render '/users/new'
    end
  end

  def index
    @users = User.all
  end
end
