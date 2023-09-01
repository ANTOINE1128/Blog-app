class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = 'posts'
    @three_recent_posts = @user.return_three_most_recent_post(3)
  end
end
