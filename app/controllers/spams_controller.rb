class SpamsController < ApplicationController
  def create
    post = Post.find(params[:post_id])

    post.flag_as_spam!

    redirect_to [post.region, post]
  end
end