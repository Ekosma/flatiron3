class StudentPeriodsController < ApplicationController

  def create
    @student_period = current_user.students_periods.build(student_period_params)
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
