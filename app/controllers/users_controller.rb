class UsersController < ApplicationController
  def index
    @users = User.all.includes(:posts, :comments)
  end

  def show
    @user = User.find(params[:id])
    @three_recent_posts = @user.return_three_most_recent_post(3)
    @posts = Post.all.includes(:user, :comments)
  end
end
