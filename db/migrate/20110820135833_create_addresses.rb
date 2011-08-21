class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :profile_id
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.integer :account_type, :default => 0
    end
  end

  def self.down
    drop_table :addresses
  end
end
