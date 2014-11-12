class PostsController < ApplicationController
  before_action :require_login, except: :show

  def new
    @post = Post.new
  end

  def create
    @region = find_region
    @post = current_user.posts.new(post_params)
    @post.save

    redirect_to [@region, @post]
  end

  def show
    @region = find_region
    @post = Post.find(params[:id])
  end

  def edit
    @region = find_region
    @post = Post.find(params[:id])
  end

  def update
    @region = find_region
    @post = Post.find(params[:id])
    @post.update(post_params)

    redirect_to [@region, @post]
  end

  def destroy
    @region = find_region
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to @region
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  def find_region
    Region.find(params[:region_id])
  end
end
