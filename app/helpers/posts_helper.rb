module PostsHelper

  def can_edit?(post)
    post.user == current_user
  end

  def render_post_content(post)
    truncate(simple_format(post.content), length: 150)
  end
end
