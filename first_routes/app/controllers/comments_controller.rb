class CommentsController < ApplicationController

  def index
    case
    when params[:user_id]
      render json: Comment.where(user_id: params[:user_id])
    when params[:artwork_id]
      render json: Comment.where(artwork_id: params[:artwork_id])
    else
      render json: Comment.all
    end

  end

  def create
    p comment_params
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end
