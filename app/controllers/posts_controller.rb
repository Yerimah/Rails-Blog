class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @posts = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to current_user, notice: 'You have successfully created a post'
    else
      render :new, alert: 'Error'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
