class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes(:group).where(user_id: current_user).recent
  end
end
