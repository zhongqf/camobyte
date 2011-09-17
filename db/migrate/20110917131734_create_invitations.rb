class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :target_id
      t.string :target_type
      t.integer :role
      t.string :email
      t.integer :invited_user_id
      t.string :token
      t.boolean :deleted, :default => false, :null => false

      t.timestamps
    end
  end
end
