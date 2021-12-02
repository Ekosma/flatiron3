class SessionsController < ApplicationController
  #skip_before_filter :verify_authenticity_token, only => :create

 def destroy
  session.clear
  @current_user = nil
  redirect_to root_path
 end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to periods_path
    else
      @error = "Incorrect login, please try again"
      redirect_to 'sessions/new'
    end
  end

  def omniauth
    @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
      user.username = auth["info"]["first_name"]
      user.password = SecureRandom.hex(10)
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
  
