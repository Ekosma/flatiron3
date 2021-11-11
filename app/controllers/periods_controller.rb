class PeriodsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @period = Period.new
  end

  def index
    #@periods = Period.find_by("id = ?", params[:id])
    @periods = Period.all
  end

  def create
    @period = current_user.periods.build(period_params)
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
    params.require(:period).permit(:period_name, :user_id)
    #params.permit(:period_name, :user_id)
  end
end
