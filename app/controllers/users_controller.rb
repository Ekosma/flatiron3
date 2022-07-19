class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :destroy, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user_id
      redirect_to period_path(@user)
    else
      @error = "Your name must be"
      @error = "Invalid Email"
      render :new
    end
  end
  
  def show
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    redirect_to root_path if !@user
  end

  #def index
    #@users = User.all
    #@periods = Period.all
    #@students = Student.all
    #@student_period = StudentPeriod.all
  #end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
