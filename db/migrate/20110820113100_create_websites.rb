class CreateWebsites < ActiveRecord::Migration
  def self.up
    create_table :websites do |t|
      t.integer :profile_id
      t.string :value
      t.integer :account_type, :default => 0
    end
  end

  def self.down
    drop_table :websites
  end
end
