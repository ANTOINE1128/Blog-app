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

  def new
    @post = Post.new
  end
def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
  
end
