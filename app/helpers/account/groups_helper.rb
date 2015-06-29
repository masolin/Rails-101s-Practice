module Account::GroupsHelper
  def render_group_title(group)
    truncate(group.title, length: 20)
  end

  def render_group_description(group)
    truncate(simple_format(group.description), length: 50)
  end
end
