class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  # /posts/3
  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to '/posts'
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def post_params
    params.require(:post).permit(:title, :content, :author, :category)
  end
end
