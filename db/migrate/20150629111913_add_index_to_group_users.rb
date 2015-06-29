class AddIndexToGroupUsers < ActiveRecord::Migration
  def change
    add_index :group_users, :group_id
    add_index :group_users, :user_id
  end
end
