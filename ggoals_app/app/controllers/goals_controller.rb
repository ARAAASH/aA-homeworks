class GoalsController < ApplicationController
  
  def new
    @goal = Goal.new
    render :new  
  end

  def create
    @goal = Goal.new(goal_param)
    @goal.user_id = current_user.id
    
  end

  def edit 
    @goal = Goal.find_by(id: params[:id])
    if @goal.nil?
      render :new
    else
      render :edit
    end
  end

  private
  def goal_param
    params.require(:goal).permit(:description, :ttype, :completed?)
  end

end