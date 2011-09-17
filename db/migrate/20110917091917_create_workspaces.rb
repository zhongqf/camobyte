class CreateWorkspaces < ActiveRecord::Migration
  def change
    create_table :workspaces do |t|
      t.integer :organization_id
      t.integer :owner_id
      t.string :name
      t.string :permalink
      t.integer :last_comment_id
      t.integer :comments_count, :default => 0
      t.integer :members_count, :default => 0
      t.string  :watchers_ids
      t.integer :tasks_count, :default => 0
      t.integer :task_lists_count, :default => 0
      t.integer :conversations_count, :default => 0
      t.integer :last_conversation_id
      t.boolean :track_time, :default => false
      t.boolean :archived, :default => false
      t.boolean :public
      t.boolean :deleted,             :default => false, :null => false

      t.timestamps
    end
  end
end
