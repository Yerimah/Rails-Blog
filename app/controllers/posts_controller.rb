class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @posts = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(
      title: post_params[:title],
      text: post_params[:text],
      author_id: post_params[:user_id],
      comments_counter: 0,
      likes_counter: 0
    )
    # @post = Post.new(post_params)
    # @post.author = current_user

    if @post.save
      @post.update_posts_counter
      redirect_to current_user
      flash[:notice] = 'You have successfully created a post'
    else
      render :new, alert: 'Error'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
