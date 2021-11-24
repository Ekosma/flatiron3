class StudentsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @student = Student.new
  end

  def index
    @students = current_user.students.all.alpha
  end

  def create
    #@period = Period.find_by_id(params[:id])
    @student = current_user.students.build(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  def show
    @student = Student.find_by_id(params[:id])
    @student_id = @student.id
    @student_grades = Grade.where("student_id = ?", @student_id)
    print(@student_grades)
    @grades = []
    @assignment_ids = []
    @student_grades.each do |sa|
      @grades << sa
      @assignment_ids<< sa.assignment_id
    end
    print(@assignment_ids)
    @assignments = Assignment.where("id = ?", @assignment_ids)
    print(@assignments)
    redirect_to students_path if !@student
  end

  private

  def student_params
    params.require(:student).permit(:student_name, :user_id)
  end

end
