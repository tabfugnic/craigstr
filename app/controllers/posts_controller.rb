class PostsController < ApplicationController
  before_action :require_login, except: :show

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save

    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end
end
