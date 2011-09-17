class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :user_group_id
      t.string :user_group_type
      t.integer :user_id
      t.string :title
      t.integer :last_comment_id
      t.integer :comments_count
      t.string :watchers_ids
      t.boolean :simple
      t.boolean :deleted

      t.timestamps
    end
  end
end
