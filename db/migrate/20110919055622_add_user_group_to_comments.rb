class AddUserGroupToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_group_id, :integer
    add_column :comments, :user_group_type, :string
  end
end
