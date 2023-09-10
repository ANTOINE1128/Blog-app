class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment successfully created'
    else
      render 'posts/show', alert: 'There was an error creating the comment'
    end
    def destroy
      @comment = Comment.find(params[:id])
      authorize! :destroy, @comment
  
      if @comment.destroy
        redirect_to post_path(@comment.post), notice: "Comment deleted successfully."
      else
        redirect_to post_path(@comment.post), alert: "Unable to delete the comment."
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
