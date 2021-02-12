class PinsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_minute

  def create
    @pin = Pin.create(user_id: current_user.id, minute_id: @minute.id)
  end

  def destroy
    @pin = Pin.find_by(user_id: current_user.id, minute_id: @minute.id)
    @pin.destroy
  end

  private

  def set_minute
    @minute = Minute.find(params[:minute_id])
  end
end
