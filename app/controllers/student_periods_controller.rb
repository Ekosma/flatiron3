class StudentPeriodsController < ApplicationController

  def new
    @student_period = StudentPeriod.new
  end

  def index
    @students_periods = students_periods.all
  end

  def create
    @student_period = StudentPeriod.new(student_period_params)
    if @student_period.save
      redirect_to periods_path
    else
      render :new
    end
  end

  private

  def student_period_params
    params.require(:student_period).permit(:period_id, :student_id)
  end
end