class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :target_id
      t.string :target_type
      t.integer :user_id
      t.text :body
      t.text :body_html
      t.integer :status
      t.boolean :deleted

      t.timestamps
    end
  end
end
