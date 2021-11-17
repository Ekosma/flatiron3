class StudentPeriodsController < ApplicationController

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
    #@student = @students
    @student_period = StudentPeriod.new
  end

  def create
    student_period_params[:student_id].each do |spp|
      selected_student_and_period_id = { :period_id => student_period_params[:period_id], :student_id => spp }
      #@student_period = StudentPeriod.new(student_period_params[:period_id], spp) needs one hash not two to work
      @student_period = StudentPeriod.new(selected_student_and_period_id)
      @student_period.save
    end
      redirect_to periods_path
  end

  def edit
    @student = []
    @period_id = params[:id]
    @period = current_user.periods.find_by_id(params[:id])
    @student_in_period = StudentPeriod.where("period_id = ?", @period_id)
    @student_in_period.each do |sip|
      @student << Student.find_by_id(sip.student_id)
    end
  end

  def destroy
    student_period_params[:student_id].each do |spp|
      if spp != ""
        selected_student_and_period_id = {:period_id => student_period_params[:period_id], :student_id => spp} 
        @student_period_table_row = StudentPeriod.find_by(selected_student_and_period_id)
        @student_period_table_row.destroy
      end
    end
      redirect_to periods_path
  end

  private

  def student_period_params
    params.require(:student_period).permit(:period_id, :student_id => [])
  end

end