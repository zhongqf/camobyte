class CreateWorkspaces < ActiveRecord::Migration
  def change
    create_table :workspaces do |t|
      t.integer :organization_id
      t.integer :owner_id
      t.string :name
      t.string :permalink
      t.integer :last_comment_id
      t.integer :comments_count
      t.integer :members_count
      t.string  :watchers_ids
      t.integer :tasks_count
      t.integer :task_lists_count
      t.integer :conversations_count
      t.integer :last_conversation_id
      t.boolean :track_time
      t.boolean :archived
      t.boolean :public
      t.boolean :deleted

      t.timestamps
    end
  end
end
