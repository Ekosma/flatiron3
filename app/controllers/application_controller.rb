class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  #Rails.application.config.middleware.use OmniAuth::Builder do
   # provider :github, ENV[7b48f2033aac4f909a9d], ENV[5b1ae3fe92f053a1b73b2a018fe8b933a9dbb6bc]
  #end

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end

end
