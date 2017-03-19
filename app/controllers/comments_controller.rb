class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      CommentsMailer.notify_post_owner(@comment).deliver_later
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  def index
     @comments = Comment.latest_first
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user)
    end

end
