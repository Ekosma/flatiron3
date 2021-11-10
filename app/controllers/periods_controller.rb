class PeriodsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @user = User.find_by_id(params[:id])
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
      @period = @user.periods.build
    else
      @period = Period.new
    end
  end

  def index
    
  end

  def create
    @period = current_user.period.build(period_params)
    if @period.save
      redirect_to periods_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @period = Period.find_by_id(params[:id])
    redirect_to periods_path if !@period
  end

  private

  def period_params
    params.require(:period).permit(:period_name)
  end
end
