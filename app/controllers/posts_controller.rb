class PostsController < ApplicationController
  before_action :require_login, except: :show
  before_action :require_owner, only: [:edit, :update, :destroy]

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
    @user = @post.user
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
    @post = Post.find(params[:id])
    @user = @post.user
    @post.delete

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  def find_region
    Region.find(params[:region_id])

  def require_owner
    post = Post.find(params[:id])

    unless post.owned_by?(current_user) || current_user.admin?
      raise User::NotAuthorized
    end
  end
end
