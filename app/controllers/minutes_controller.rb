class MinutesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_minute, only: [:show, :edit, :update, :destroy]
  before_action :not_user_permitted, only: [:edit, :destroy]

  def index
    @minutes = Minute.all.order(id: 'DESC')
  end

  def new
    @minute = Minute.new
  end

  def create
    @minute = Minute.new(minute_params)
    if @minute.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @minute.comments
    @comment = @minute.comments
  end

  def edit
  end

  def update
    if @minute.update(minute_params)
      redirect_to minute_path(@minute.id)
    else
      render :edit
    end
  end

  def destroy
    @minute.destroy
    redirect_to root_path
  end

  private

  def minute_params
    params.require(:minute).permit(:title, :project_name, :participate_member, :meeting_date, :all_complete_date, :content,
                                   images: []).merge(user_id: current_user.id)
  end

  def set_minute
    @minute = Minute.find(params[:id])
  end

  def not_user_permitted
    redirect_to root_path unless @minute.user_id == current_user.id
  end
end
