class AssignmentsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @period_id = params[:format]
    @period = current_user.periods.find_by_id(params[:format])
    @assignment = Assignment.new(params[:id])
  end

  def create
    @period_id = params[:id]
    @period = current_user.periods.find_by_id(params[:id])
    @assignment = Assignment.new(assignment_params)
    print(@assignment)
    if @assignment.save
      redirect_to periods_path
    else
      redirect_to :new
    end
  end

  def index
    @periods = current_user.periods.all
    @assignments = current_user.assignments.all
  end

  def edit
    @assignment = Assignment.find_by_id(params[:id])
    @period_id = @assignment.period_id
  end

  def update
    @assignment = Assignment.find_by(id: params[:id])
    redirect_to assignments_path if !@assignment
    if @assignment.update(assignment_params)
      redirect_to assignment_path(@assignment)
    else
      render :edit
    end
  end

  def destroy
    Assignment.find(params[:id]).destroy
    redirect_to assignments_path
  end

  def show
    @student = []
    @student_ids = []
    @assignment_id = params[:id]
    @assignment = Assignment.find_by_id(params[:id]) 
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

  private

  def assignment_params
    params.require(:assignment).permit(:assignment_name, :period_id)
  end

end
