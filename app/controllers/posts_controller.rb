class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  # before_action: find_post
  before_action(:find_post, {only: [:show, :edit, :update, :destroy, :update ]})

  before_action :authorize, only: [:edit, :destroy, :update]


  def new
    @post = Post.new
    @category = Category.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
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
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit

  end

  def liked_post
    @user = current_user
    
    render :liked_post
  end

  def update
    if @post.update question_params
      redirect_to question_path(@post), notice: 'Post updated!'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to questions_path, notice: 'Post deleted!'
  end


  private
    def post_params
      params.require(:post).permit(:id, :title, :body, :category_id)
    end

    def find_post
      @post = Post.find params[:id]
    end

    def authorize
        if cannot?(:manage, @post)
          redirect_to root_path, alert: 'Not authorized!'
        end
    end

end
