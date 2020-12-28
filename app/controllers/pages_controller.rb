# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @posts = Post.all.with_attached_image
  end
end
