class PeriodsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @period_id = params[:format]
    @period = Period.new
  end

  def index
    #@periods = Period.find_by("id = ?", params[:id])
    #@periods = Period.all
    @periods = current_user.periods.all
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
    @period = Period.find_by_id(params[:id])
    #redirect_to periods_path if !@period || @period.user != current_user
  end

  def update
    @period = Period.find_by(id: params[:id])
    redirect_to periods_path if !@period || @period.user != current_user
    if @period.update(period_params)
      redirect_to period_path(@period)
    else
      render :edit
    end
  end

  def show
    @student = []
    @period_id = params[:id]
    @period = Period.find_by_id(params[:id])
    student_id = StudentPeriod.where("period_id = ?", @period_id) 
    student_id.each do |student|
      @student << Student.find_by(id: student.student_id)
    end
    @assignments = current_user.assignments.all
    redirect_to periods_path if !@period
  end

  def destroy
    Period.find(params[:id]).destroy
    redirect_to periods_path
  end

  private

  def period_params
    params.require(:period).permit(:period_name, :user_id)
    #params.permit(:period_name, :user_id)
  end

end
