class ToDoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_to_do_list, only: [:edit, :update]

  def new
    @to_do_list = ToDoList.new
  end

  def create
    @to_do_list = ToDoList.new(to_do_list_params)
    if @to_do_list.save
      redirect_to minute_path(params[:minute_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @to_do_list.update(to_do_list_params)
      redirect_to minute_path(params[:minute_id])
    else
      render :edit
    end
  end

  private

  def to_do_list_params
    params.require(:to_do_list)
          .permit(:list1, :list2, :list3, :list4, :list5, :list6, :list7, :list8, :list9, :list10,
                  :checked_list1, :checked_list2, :checked_list3, :checked_list4, :checked_list5,
                  :checked_list6, :checked_list7, :checked_list8, :checked_list9, :checked_list10)
          .merge(user_id: current_user.id, minute_id: params[:minute_id])
  end

  def set_to_do_list
    @to_do_list = ToDoList.find(params[:id])
  end
end
