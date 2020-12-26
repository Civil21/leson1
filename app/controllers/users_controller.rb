class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
    @likes = @posts.map { |post| post.likes.count }.sum
  end
end
