class PostsController < ApplicationController
    before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
	  @post = current_user.posts.new
	end

	def create
	  @post = current_user.posts.new(post_params)
	  if @post.save
	  	redirect_to posts_path, notice: "Post created successfully"
	  else
	  	render 'new'
	  end
	end

	def edit
	end

	def update
	  if @post.update(post_params)
	    redirect_to root_url, notice: "Post updated successfully"
	  else
	    render 'edit'
	  end
	end

	def destroy
	  if @post.destroy
	     redirect_to posts_path, notice: "Post created successfully"
    else
       redirect_to posts_path, notice: "Something went wrong"
    end
	end

	def show
	end

  def index
      @posts = Post.paginate(:page => params[:page], per_page: 2)
	end

 private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
