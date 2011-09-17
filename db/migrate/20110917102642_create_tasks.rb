class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :workspace_id
      t.integer :user_id
      t.integer :task_list_id
      t.integer :parent_id
      t.string :name
      t.integer :position
      t.integer :comments_count
      t.integer :last_comment_id
      t.string :watchers_ids
      t.integer :status
      t.date :due_on
      t.datetime :completed_at
      t.boolean :deleted
      t.integer :subtasks_count
      t.integer :last_subtask_id
      t.string :assignee_ids

      t.timestamps
    end
  end
end
