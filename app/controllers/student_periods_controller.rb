class StudentPeriodsController < ApplicationController

  def new
    @student = []
    @student_ids = []
    @period_id = params[:format]
    @student_in_period = StudentPeriod.where("period_id = ?", @period_id)
    @student_in_period.each do |sip|
      @student_ids << sip.student_id
    end
    Student.all.each do |student|
      if  !@student_ids.include?(student.id) && current_user.id == student.user_id
        @student << student
      end
    end
    #@student = @students
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
      #flashmessage
      redirect_to periods_path
    end
  end

  private

  def student_period_params
    params.require(:student_period).permit(:period_id, :student_id)
  end
end