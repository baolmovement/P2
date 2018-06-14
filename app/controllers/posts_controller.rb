class PostsController < ApplicationController
  def home 
    @posts = Post.all 
    # @f_posts = Post.where(platform:'FILM') 
    # @t_posts = Post.where(platform:'TELEVISION') 
    # @b_posts = Post.where(platform:'BOOK')
  end     
  
  def index
    if params[:platform] 
      @posts = Post.where(platform: params[:platform])
    else
      @posts = Post.all 
    end  
    # @f_posts = Post.where(platform:'FILM') 
    # @t_posts = Post.where(platform:'TELEVISION') 
    # @b_posts = Post.where(platform:'BOOK')
  end
  
  def show   
    @post = Post.find(params[:id]) 
  end

  def new 
    @post = Post.new
  end

  def create 
    # @user = User.find(params[:id]) 
    # @post.title = params[:post][:title]
    # @post.body = params[:post][:body]   
    # @post.genre = params[:post][:genre] 
    # @post.style = params[:post][:style] 
    # @post.platform = params[:post][:platform]
    # @post.user = @user
    @post = current_user.posts.new(post_params)
    @post.save 
    redirect_to posts_path
  end 

  def edit 
    @post = Post.find(params[:id])
  end 
  
  def update   
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]   
    @post.genre = params[:post][:genre] 
    @post.style = params[:post][:style] 
    @post.platform = params[:post][:platform] 
    @post.image = params[:post][:image]
    @post.save
    redirect_to post_path(@post)
  end

  def destroy 
    @post = Post.find(params[:id])  
    @post.destroy 
    redirect_to user_path(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :genre, :style, :platform, :image)
  end
end 

#       t.string :title
#       t.string :body
#       t.string :genre
#       t.string :style
#       t.string :platform
