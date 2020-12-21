# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_comment, only: [:destroy]
  def create
    params[:comment][:user_id] = current_user.id
    comment = post.comments.build(comment_params)
    if comment.save
      redirect_to post_path(comment.post_id) + '#comment_' + comment.id.to_s
    else
      pp 'error'
    end
  end

  def comment_create
    params[:comment][:user_id] = current_user.id
    @comment = comment.comments.build(comment_params)
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

  def post
    @post = Post.find(params[:post_id])
  end

  def comment
    @comment ||= Comment.find(params[:comment_id])
  end

  def user_comment
    redirect_back(fallback_location: root_path) unless @comment = current_user.comments.find_by(id: params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id, :comment_id)
  end
end
