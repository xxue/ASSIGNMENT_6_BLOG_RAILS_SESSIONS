class PostsController < ApplicationController

  def new
    @post = Post.new
    @category = Category.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
     @posts = Post.order(created_at: :desc)
     @featured_post = @posts.first
     @popular = Post.popular.limit(10)
   end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
    @comments = @post.comments
  end

  private
    def post_params
      params.require(:post).permit(:id, :title, :body, :category_id)
    end

end
