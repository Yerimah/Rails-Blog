class LikesController < ApplicationController
  def create
    @like = Like.new(
      author_id: current_user.id,
      post_id: params[:post_id]
    )

    if @like.save
      @like.update_likes_counter
      redirect_to user_posts_path
      flash[:notice] = 'You liked this post!'
    else
      redirect_to user_posts_path, alert: 'Error occured. Could not like this post'
    end
  end
end
