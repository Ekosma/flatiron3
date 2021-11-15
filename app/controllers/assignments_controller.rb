class AssignmentsController < ApplicationController
  #before_save :normalize_blank_values

  def new
    @student = []
    @student_ids = []
    @period_id = params[:format]
    @period = current_user.periods.find_by_id(params[:format])
    @student_in_period = StudentPeriod.where("period_id = ?", @period_id)
    @student_in_period.each do |sip|
      @student_ids << sip.student_id
    end
    Student.all.each do |student|
      if  !@student_ids.include?(student.id) && current_user.id == student.user_id
        @student << student
      end
    end
    @assignment = Assignment.new
  end

  def create
    assignment_params[:student_id].each do |ap|
      selected_params = {:assignment_name => assignment_params[:assignment_name], :grade => nil, :period_id => assignment_params[:period_id], :student_id => ap }
      @assignment = Assignment.new(selected_params)
      @assignment.save
    end
      redirect_to periods_path
  end

  def edit 

  end

  def update

  end

  def destroy

  end

  private

  def assignment_params
    params.require(:assignment).permit(:assignment_name, :grade, :period_id, :student_id => [])
  end
end
