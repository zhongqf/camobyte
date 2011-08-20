class CreatePhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :phone_numbers do |t|
      t.integer :profile_id
      t.string :value
      t.integer :account_type
    end
  end

  def self.down
    drop_table :phone_numbers
  end
end
