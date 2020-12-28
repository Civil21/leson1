# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  before_action :user_post, only: %i[edit update destroy]
  # before_action :post

  def index
    @posts = Post.all.includes(likes: :user).with_attached_image
  end

  def show
    post.new_view
    @comments = post.comments
  end

  def new
    @post = Post.new
  end

  def create
    category = Category.find_or_create_by(name: params[:post][:category])
    @post = current_user.posts.build(post_params)
    @post.category = category
    if post.save
      redirect_to post
    else
      pp 'error' + post
    end
  end

  def edit; end

  def update
    # category = Category.find_or_create(name: params[:post][:category])
    # @post.category = category
    post.update(post_params)
    redirect_to post
  end

  def destredirect_back(fallback_location: root_path)
    post.destroy
    redirect_to posts_path
  end

  def like
    if like = Like.find_by(user_id: current_user.id, post_id: post.id)
      like.destroy
      respond_to do |format|
        format.json { render json: { count: post.likes.count, like: true } }
      end
    else
      # like = Like.find_or_create(user_id: current_user.id, post_id: post.id)
      like = post.likes.build(user_id: current_user.id)
      if like.save
        respond_to do |format|
          format.json { render json: { count: post.likes.size, like: false } }
        end
      else
        respond_to do |format|
          format.json { render json: { error: 'not save' } }
        end
      end
    end
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end

  def user_post
    redirect_back(fallback_location: root_path) unless @post = current_user.posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :body, :image, :category_id, images: [])
  end
end
