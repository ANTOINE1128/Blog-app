class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @posts = Post.all
    @post = Post.find params[:id]
    @post_id = @posts.index(@post) + 1
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
    @posts = @user.posts.order(created_at: :asc)
  end

  def create
    set_current_user
    @post = set_current_user.posts.build(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_post_path(@current_user.id, @post.id), notice: 'Post was successfully Created'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end



# def index
#   @post = Post.new
#   @user = User.find(params[:user_id])
#   @posts = @user.posts.order(created_at: :asc)
# end

# def show
#
# end

# def new
#   @post = Post.new
# end
# def create
#   @post = current_user.posts.build(post_params)

#   if @post.save
#     respond_to do |format|
#       format.turbo_stream do
#         render turbo_stream: turbo_stream.append(
#           @post,
#           partial: "posts/post",
#           locals: { post: @post }
#         )
#       end
#       format.html { redirect_to user_posts_path(current_user), notice: 'Post was successfully created.' }
#     end
#   else
#     respond_to do |format|
#       format.turbo_stream do
#         render turbo_stream: turbo_stream.replace(
#           "new_post",
#           partial: "posts/form",
#           locals: { post: @post }
#         )
#       end
#       format.html { render :new }
#     end
#   end
# end

# private

# def post_params
#   params.require(:post).permit(:title, :content)
# end
