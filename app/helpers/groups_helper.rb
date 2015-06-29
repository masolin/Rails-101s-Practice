module GroupsHelper
  def has_joined?(group)
    group.users.include?(current_user)
  end
end
