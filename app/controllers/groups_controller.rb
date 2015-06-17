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
      redirect_to @group, notice: "Group created!"
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to @group, notice: "Group updated!"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert: "Group deleted!"
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end
end
