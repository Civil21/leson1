# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_comment, only: [:destroy]

  def create
    params[:comment][:user_id] = current_user.id
    params[:comment][:object_type] = params[:object_type]
    params[:comment][:object_id] = params[:object_id]
    comment = Comment.new(comment_params)
    if comment.save
      redirect_back(fallback_location: root_path)
    else
      pp 'error'
    end
  end

  def destroy
    # @post = comment.post if comment.post
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def object
    # @object ||= params[:type].constan
  end

  def user_comment
    redirect_back(fallback_location: root_path) unless @comment = current_user.comments.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :object_type, :object_id, :user_id)
  end
end
