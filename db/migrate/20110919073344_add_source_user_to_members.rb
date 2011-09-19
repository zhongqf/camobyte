class AddSourceUserToMembers < ActiveRecord::Migration
  def change
    add_column :members, :source_user_id, :integer
  end
end
