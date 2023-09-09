class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id] == 'sign_out'
      sign_out(current_user)
      redirect_to new_user_session_path, notice: 'You have signed out.'
    else
      @user = User.find(params[:id])
      @user_posts = @user.posts
      @recent_posts = @user_posts.limit(3)
    end
  end
end
