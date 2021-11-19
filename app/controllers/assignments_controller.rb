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
    @period_ids = []
    @periods = current_user.periods.all
    #@periods.each do |p|
      #hash = p.id
      #@period_ids << hash
    #end
    #@assign_per_period = []
    #@period_ids.each do |value|
      #@assign_per_period << Assignment.where("period_id = ?", value)
    #end
    #print(@assign_per_period)
    @assignments = current_user.assignments.all
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def show
    @assignment = []
    @period_id = params[:id]
    @period = current_user.periods.find_by_id(params[:id])
    @period_assignment = Assignment.where("period_id = ?", @period_id)
    @period_assignment.each do |pa|
      @assignment << pa
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:assignment_name, :period_id)
  end

end
