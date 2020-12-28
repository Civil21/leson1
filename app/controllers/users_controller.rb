class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.with_attached_image
    @comments = @user.comments
    @likes = @posts.map { |post| post.likes.size }.sum
  end
end
