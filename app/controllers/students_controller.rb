class StudentsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @student = Student.new
  end

  def index
    @students = current_user.students.all
  end

  def create
    @student = current_user.students.build(student_params)
    if @student.save
      redirect_to period_path
    else 
      render :new
    end
  end

  def show
    @student = Student.find_by_id(params[:id])
    redirect_to students_path if !@student
  end

  private

  def student_params
    params.require(:student).permit(:student_name, :user_id)
  end

end
