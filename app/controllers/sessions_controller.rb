class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(params[:id])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash.notice = "Logged in as #{@user.name}."
      redirect_to :root 
    else
      flash.notice = 'Failed to log in.'
      redirect_to :root
    end
  end

  def destroy
    session.delete(:user_id)
    flash.notice = 'Logged out.'
    redirect_to :root
  end
end
