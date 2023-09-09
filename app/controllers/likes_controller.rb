class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.new(author_id: @user.id, post_id: @post.id)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Like created'
    else
      redirect_to user_post_path(@user, @post), alert: 'error creating the Like'
    end
  end
end
