class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :email
      t.string :login
      t.string :first_name
      t.string :last_name
      t.string :common_name
      t.text :biography
      t.string :time_zone
      t.string :locale
      t.string :first_day_of_week

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
