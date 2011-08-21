class CreateIms < ActiveRecord::Migration
  def self.up
    create_table :ims do |t|
      t.integer :profile_id
      t.string :value
      t.integer :account_im_type, :default => 0
      t.integer :account_type, :default => 0
    end
  end

  def self.down
    drop_table :ims
  end
end
