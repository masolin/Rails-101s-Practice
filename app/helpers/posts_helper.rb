module PostsHelper

  def is_editable?(post)
    false
    true if post.user == current_user
  end
end
