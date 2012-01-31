class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, :limit => 50, :null =>false
      t.string :url_name, :limit => 50, :null => false

      t.timestamps
    end

    add_index :brands, :url_name, :unique =>true
  end
end
