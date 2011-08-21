class CreateSocialNetworks < ActiveRecord::Migration
  def self.up
    create_table :social_networks do |t|
      t.integer :profile_id
      t.string :value
      t.integer :account_network_type, :default => 0
      t.integer :account_type, :default => 0
    end
  end

  def self.down
    drop_table :social_networks
  end
end
