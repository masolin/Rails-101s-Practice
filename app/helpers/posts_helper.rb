module PostsHelper

  def can_edit?(post)
    post.user == current_user
  end
end
