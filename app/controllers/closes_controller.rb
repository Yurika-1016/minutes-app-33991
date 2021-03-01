class ClosesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_close
  before_action :not_user_permitted

  def create
    @close = Close.create(minute_id: @minute.id)
  end

  def destroy
    @close = Close.find_by(minute_id: @minute.id)
    @close.destroy
  end

  private

  def set_close
    @minute = Minute.find(params[:minute_id])
  end

  def not_user_permitted
    redirect_to minute_path(@minute.id) unless current_user.id == @minute.user_id
  end
end
