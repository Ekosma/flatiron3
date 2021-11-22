class GradesController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def new
    @student = []
    @student_ids = []
    @assignment_id = params[:format]
    @assignment = Assignment.find_by_id(params[:format])
    @period_id = @assignment.period_id
    @student_in_period = StudentPeriod.where("period_id = ?", @assignment.period_id)
    @student_in_period.each do |sip|
      @student_ids << sip.student_id
    end
    Student.all.each do |student|
      if  @student_ids.include?(student.id) && current_user.id == student.user_id
        @student << student
      end
    end
  end

  def create
    grade_params[:student_id].each do |spp|
      selected_grade = { :grade => grade_params[:grade], :assignment_id => grade_params[:assignment_id], :student_id => spp }
      @grade_assign = Grade.new(selected_grade)
      @grade_assign.save
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

  def grade_params
    params.require(:grade).permit(:grade, :assignment_id, :student_id => [])
  end



end
