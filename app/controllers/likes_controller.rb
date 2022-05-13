class LikesController < ApplicationController
  def create
    @like = Like.new(
      author_id: params[:user_id],
      post_id: params[:post_id]
    )

    if @like.save
      @like.update_likes_counter
      redirect_to user_posts_path, notice: 'You liked this post!'
    else
      redirect_to user_posts_path, alert: 'Error occured. Could not like this post'
    end
  end
end
