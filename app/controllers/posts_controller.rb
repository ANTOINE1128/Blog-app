class PostsController < ApplicationController
  def index
    @post = Post.new
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :asc)
    
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
