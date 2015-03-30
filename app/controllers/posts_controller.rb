class PostsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.published = Time.now
    if @post.save
      flash[:notice] = "Your post was successfully created."
      redirect_to posts_path
    else
      render :new
    end
  end

private
  def post_params
    params.require(:post).permit(:body)
  end
end
