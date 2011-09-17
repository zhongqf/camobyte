class CreateTaskLists < ActiveRecord::Migration
  def change
    create_table :task_lists do |t|
      t.integer :workspace_id
      t.integer :user_id
      t.string :name
      t.integer :position
      t.integer :last_comment_id
      t.integer :comments_count, :default => 0
      t.string  :watchers_ids
      t.boolean :archived, :default => false
      t.integer :archived_tasks_count, :default => 0
      t.integer :tasks_count, :default => 0
      t.datetime :completed_at
      t.date :start_on
      t.date :finish_on
      t.boolean :deleted, :default => false, :null => false

      t.timestamps
    end
  end
end
