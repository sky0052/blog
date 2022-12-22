class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @tags = Tag.all
    @tag_id = Post.find(params[:id]).tag_ids
  end

  def new
    @post = Post.new()
  end

  def create
      @post = Post.create(post_params)
      if @post.save
        redirect_to admin_posts_path
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    @tags = Tag.all
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
        params[:people].each do |tag_ids|
          @post.post_tags.create(tag_id: tag_ids)
        end
      if @post.update(post_params)
        redirect_to admin_posts_path
      else
        render :edit, status: :unprocessable_entity
      end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :is_publish, :user_id)
  end
end
