class PostsController < ApplicationController
  def index
    @posts = Post.all 
  end

  def show
    @post = Post.find(params[:id])
  end
 
  def new
    @post = Post.new 

    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create 
    @post = Post.create(post_params)

    if @post.valid?
      redirect_to post_path(@post)
    else
      flash[:errors] = @post.errors.full_messages

      redirect_to new_post_path
    end 

  end 

  def edit
    @post = Post.find(params[:id])
  end 

  def update 
    @post = Post.update(post_params)

    redirect_to post_path(@post)
  end 

  def like
    @post = Post.find(params[:id])
    @post.likes = @post.likes + 1

    @post.save 

    redirect_to post_path(@post)
  end 

  private 

  def post_params
    params.require(:post).permit(:title, :content, :destination_id, :blogger_id)
  end 
end
