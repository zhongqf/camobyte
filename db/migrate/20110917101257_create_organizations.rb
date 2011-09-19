class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.integer :company_id
      t.string :name, :null => false
      t.string :permalink, :null => false
      t.text :description
      t.string :domain
      t.text :settings
      t.boolean :deleted,             :default => false, :null => false

      t.timestamps
    end
  end
end
