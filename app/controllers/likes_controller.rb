class LikesController < ApplicationController
  before_action :like_params, only: [:create]

  def create
    @user = User.includes(posts: :comments).find(params[:user_id])
    @post = Post.includes(:comments).find(params[:post_id])
    @like = Like.new(author_id: @user.id, post_id: @post.id)
    if @like.save
      flash[:notice] = 'Like was successfully created.'
    else
      flash[:alert] = 'Failed to add like.'
    end
    redirect_to user_post_path(@user, @post)
  end

  def like_params
    params.require(:like).permit(:author_id) # Make sure you have :author_id in the permit list.
  end
end
