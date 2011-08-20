class CreateEmailAddresses < ActiveRecord::Migration
  def self.up
    create_table :email_addresses do |t|
      t.integer :profile_id
      t.string :value
      t.integer :account_type
    end
  end

  def self.down
    drop_table :email_addresses
  end
end
