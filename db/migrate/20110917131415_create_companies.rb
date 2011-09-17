class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :permalink
      t.string :domain
      t.text :description
      t.string :language
      t.string :time_zone
      t.text :settings
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.boolean :deleted

      t.timestamps
    end
  end
end
