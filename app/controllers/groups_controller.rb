class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @groups = Group.all
  end

  def show
    # include user of post to prevent n+1 query
    @group = Group.includes(posts: :user).find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      @group.users << current_user
      redirect_to @group, notice: "Group created!"
    else
      render :new, alert: "Group created fail!"
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notice: "Group updated!"
    else
      render :edit, alert: "Group updated fail!"
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, notice: "Group deleted!"
  end

  def join
    @group = Group.find(params[:id])
    if @group.users.include?(current_user)
      redirect_to @group, alert: "You have already joined the group!"
    else
      @group.users << current_user
      redirect_to @group, notice: "Join the group successfully!"
    end
  end

  def quit
    @group = Group.find(params[:id])
    if @group.users.include?(current_user)
      @group.users.delete(current_user)
      redirect_to @group, notice: "Quit the group successfully!"
    else
      redirect_to @group, alert: "You are not member of the group!"
    end
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end
end
