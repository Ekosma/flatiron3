class GradesController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def new
    @student = []
    @student_id = []
    @grades = []
    @assignment_id = params[:format]
    @assignment = Assignment.find_by_id(params[:format])
    @student_in_period = StudentPeriod.where("period_id = ?", @assignment.period_id)
    @assign_grade = Grade.where("assignment_id = ?", params[:format])
    @assign_grade.each do |g|
      @grades << g.student_id
    end
    @student_in_period.each do |sip|
      if @grades.exclude?(sip.student_id)
        @student_id << sip.student_id
      end
    end
    Student.all.each do |s|
      if  @student_id.include?(s.id)
        @student << s
      end
    end
    print(@student)
    @grade = Grade.new
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
