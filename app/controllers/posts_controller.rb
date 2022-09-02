class PostsController < ApplicationController
  
  before_action :authenticate_user!, only: [:create, :show]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end
end
