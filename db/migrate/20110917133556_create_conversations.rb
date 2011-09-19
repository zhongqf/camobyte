class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_group_id
      t.string :user_group_type
      t.integer :user_id
      t.string :title
      t.integer :last_comment_id
      t.integer :comments_count, :default => 0, :null => false
      t.string :watchers_ids
      t.boolean :simple, :default => false
      t.boolean :deleted, :default => false, :null => false

      t.timestamps
    end
  end
end
