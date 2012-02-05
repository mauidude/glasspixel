class CreateExifNames < ActiveRecord::Migration
  def change
    create_table :exif_names do |t|
      t.string :exifable_type, :null => false, :limit => 50
      t.references :exifable, :null =>false
      t.string :name, :null => false, :limit => 128
    end

    add_index :exif_names, [:exifable_type, :name], :unique => true
  end
end
