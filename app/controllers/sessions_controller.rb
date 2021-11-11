class SessionsController < ApplicationController

 def destroy
  session.clear
  @current_user = nil
  redirect_to root_path
 end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to period_path(@user)
    else
      flash[:message] = "Incorrect login, please try again"
      redirect_to 'sessions/new'
    end
  end
  
end