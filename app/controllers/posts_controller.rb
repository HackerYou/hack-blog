class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  # /posts/3
  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to '/posts'
    else
      render 'new'
    end
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

  def search
    @posts = Post.entitled(params[:q])

    render 'index'
  end

  def post_params
    params.require(:post).permit(:title, :content, :author, :category)
  end
end
