class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @three_recent_posts = @user.return_three_most_recent_post(3)
    @posts = Post.all
  end
end


# class UsersController < ApplicationController
#   def index
#     @users = User.all
#   end

#   def show
#     @user = User.find(params[:id])
#     @three_recent_posts = @user.return_three_most_recent_post(3)
#   end

#   def new
#     @user = User.new
#   end

#   def create
#     @user = User.new(user_params)

#     if @user.save
#       redirect_to user_posts_path(@user.id), notice: 'User was successfully created. You can now create a new post.'
#     else
#       render :new
#     end

#   end

#   private

#   def user_params
#     params.require(:user).permit(:name, :bio, :photo, :posts_counter)
#   end
# end
