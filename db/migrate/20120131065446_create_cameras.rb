class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :name, :limit => 50, :null =>false
      t.string :url_name, :limit => 50, :null => false
      t.references :brand, :null => false

      t.timestamps
    end

    add_index :cameras, :brand_id
    add_index :cameras, :url_name, :unique => true
  end
end
