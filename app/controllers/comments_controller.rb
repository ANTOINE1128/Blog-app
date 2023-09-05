class CommentsController < ApplicationController
  def new
    @post = Post.includes(:comments).find(params[:post_id])
    @comment = Comment.new
    @user = @current_user
  end

  def create
    @comment = Comment.new
    @user = User.find(params[:user_id]) # Get the user from params
    @post = Post.includes(:comments).find(params[:post_id])
    @comment = @post.comments.new(comment_params.merge(author: @user))

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
