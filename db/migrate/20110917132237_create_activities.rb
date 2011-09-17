class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.integer :target_id
      t.string :target_type
      t.integer :user_group_id
      t.string :user_group_type
      t.integer :comment_target_id
      t.string :comment_target_type
      t.string :action
      t.boolean :deleted, :default => false, :null => false

      t.timestamps
    end
  end
end
