class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :user_id
      t.integer :organization_id
      t.integer :role

      t.timestamps
    end
  end
end
