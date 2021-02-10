class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :not_user_permitted, only: [:edit, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to minute_path(params[:minute_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to minute_path(params[:minute_id])
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to minute_path(params[:minute_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:title).merge(user_id: current_user.id, minute_id: params[:minute_id])
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id], minute_id: params[:minute_id])
  end

  def not_user_permitted
    redirect_to root_path unless @comment.user_id == current_user.id
  end
end
