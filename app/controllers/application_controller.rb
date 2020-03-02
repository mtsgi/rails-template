class ApplicationController < ActionController::Base
  helper_method :account

  private

  def account
    User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
