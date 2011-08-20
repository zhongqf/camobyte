class CreateIms < ActiveRecord::Migration
  def self.up
    create_table :ims do |t|
      t.integer :profile_id
      t.string :value
      t.integer :account_im_type
      t.integer :account_type
    end
  end

  def self.down
    drop_table :ims
  end
end
