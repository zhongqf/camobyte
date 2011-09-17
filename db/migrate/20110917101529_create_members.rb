class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_group_id
      t.string  :user_group_type
      t.integer :user_id
      t.integer :role

      t.timestamps
    end
  end
end
