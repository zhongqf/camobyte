class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.integer :company_id
      t.integer :owner_id
      t.string :name, :null => false
      t.string :permalink, :null => false
      t.integer :last_comment_id
      t.integer :comments_count, :default => 0, :null => false
      t.string :watchers_ids
      t.integer :conversations_count, :default => 0, :null => false
      t.integer :last_conversation_id
      t.boolean :public
      t.boolean :deleted, :default => false, :null => false

      t.timestamps
    end
  end
end
