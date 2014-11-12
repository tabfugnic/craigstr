class PostsController < ApplicationController
  before_action :require_login, except: :show

  def new
    @region = find_region
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)
    post.region = find_region
    post.save

    redirect_to [post.region, post]
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)

    redirect_to [post.region, post]
  end

  def destroy
    region = find_region
    post = Post.find(params[:id])
    post.destroy

    redirect_to region
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  def find_region
    Region.find(params[:region_id])
  end
end
