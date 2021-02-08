class MinutesController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @minute =Minute.new
  end

  def create
    @minute =Minute.new(minute_params)
    if @minute.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def minute_params
    params.require(:minute).permit(:title, :project_name,:participate_member, :meeting_date, :all_complete_date, :content, images: [] ).merge(user_id: current_user.id)
  end
end
