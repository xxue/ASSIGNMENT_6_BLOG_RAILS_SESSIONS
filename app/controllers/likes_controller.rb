
class LikesController < ApplicationController
  before_action :find_post, only: [:create]
  before_action :authenticate_user!

  def create
    @like = @post.likes.new user: current_user

    if cannot? :like, @post
        redirect_to posts_path, alert: "cant like your own post"
    else
        @like.save
        redirect_to posts_path
    end
    # render json:params
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_path
  end

  private
    def find_post
      @post = Post.find(params[:post_id])
    end

end
