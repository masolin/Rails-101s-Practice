class AddPostsCountToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :posts_count, :integer, default: 0
    Group.pluck(:id).each { |ix| Group.reset_counters(ix, :posts) }
  end
end
