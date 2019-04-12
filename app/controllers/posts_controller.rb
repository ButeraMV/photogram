class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to @post
    else
      flash[:alert] = 'Something is wrong with your form'
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Post updated'
      redirect_to @post
    else
      flash[:alert] = 'Something is wrong with your form'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post deleted'
      redirect_to posts_path
    else
      flash[:alert] = 'Something went wrong..'
      redirect_to @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
