class AddDeletedToTables < ActiveRecord::Migration
  def change
    add_column :members, :deleted, :boolean, :default => false, :null => false
    add_column :people, :deleted, :boolean, :default => false, :null => false
    add_column :profiles, :deleted, :boolean, :default => false, :null => false
    add_column :users, :deleted, :boolean, :default => false, :null => false
  end
end
