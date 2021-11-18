class AssignmentsController < ApplicationController

  def new
    @period_id = params[:format]
    @period = current_user.periods.find_by_id(params[:format])
    @assignment = Assignment.new(params[:id])
  end

  def create
    print(assignment_params)
    @period_id = params[:id]
    @period = current_user.periods.find_by_id(params[:id])
    @assignment = Assignment.new(assignment_params)
    print(@assignment)
    if @assignment.save
      redirect_to periods_path
    end
  end

  def index

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def assignment_params
    params.require(:assignment).permit(:assignment_name, :period_id)
  end

end
