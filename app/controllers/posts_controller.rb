class PostsController < ApplicationController
  before_action :find_group
  before_action :member_required, only: [:new, :create, :update, :destroy]
  before_action :authenticate_user!

  def new
    @post = @group.posts.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = @group.posts.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @group, notice: "Post created!"
    else
      render :new
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @group, notice: "Post updated!"
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
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

  def member_required
    if !@group.users.include?(current_user)
      redirect_to @group, alert: "You are not member of group!"
    end
  end
end
