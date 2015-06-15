class PostsController < ApplicationController
  before_action :find_group

  def new
    @post = @group.posts.new
  end

  def edit
    @post = @group.posts.find(params[:id])
  end

  def create
    @post = @group.posts.new(post_params)
    if @post.save
      redirect_to @group, notice: "Post created!"
    else
      render :new
    end
  end

  def update
    @post = @group.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @group, notice: "Post updated!"
    else
      render :edit
    end
  end

  def destroy
    @post = @group.posts.find(params[:id])
    @post.destroy
    redirect_to @group, alert: "Post deleted!"
  end

  private
  def find_group
    @group = Group.find(params[:group_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
