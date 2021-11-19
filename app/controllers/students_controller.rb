class StudentsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @student = Student.new
  end

  def index
    @students = current_user.students.all
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
    #@assignments = []
    #@student_assignments = Assignment.where("student_id = ?", @student_id)
      #@student_assignments.each do |sa|
        #@assignments << sa
      #end
    redirect_to students_path if !@student
  end

  private

  def student_params
    params.require(:student).permit(:student_name, :user_id)
  end

end
