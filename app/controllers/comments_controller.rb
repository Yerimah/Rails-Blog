class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(
      text: params['comment']['text'],
      author_id: current_user.id,
      post_id: params[:post_id]
    )

    if @comment.save
      @comment.update_comments_counter
      redirect_to user_posts_path(params[:user_id]), notice: 'You have successfully created a comment'
    else
      redirect_to user_posts_path(params[:user_id]), notice: 'Error! comment could not be created'
    end
  end
end
