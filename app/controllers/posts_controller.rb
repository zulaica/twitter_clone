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
      respond_to do |format|
        flash[:notice] = "Your post was successfully created."
        format.html { redirect_to posts_path }
        format.js
      end
    else
      render :new
    end
  end

private
  def post_params
    params.require(:post).permit(:body)
  end
end
