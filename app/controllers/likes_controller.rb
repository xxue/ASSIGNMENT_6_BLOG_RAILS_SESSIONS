
class LikesController < ApplicationController
  before_action :find_post, only: [:create]
  before_action :authenticate_user!

  def create
    @like = @post.likes.create
    redirect_to posts_path
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
