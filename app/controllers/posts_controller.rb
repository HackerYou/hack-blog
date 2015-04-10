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
      if params[:post_to_twitter].present?
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV['TWITTER_APP_ID']
          config.consumer_secret     = ENV['TWITTER_SECRET']
          config.access_token        = current_user.token
          config.access_token_secret = current_user.secret
        end

        client.update("New Blog Post: #{@post.title}")
      end

      redirect_to '/posts', notice: "Post create!"
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

  # DELETE /posts/:id
  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    redirect_to posts_url, notice: "Post deleted"
  end

  def post_params
    params.require(:post).permit(:title, :content, :author, :category, :user_id)
  end
end
