class CreateExifNames < ActiveRecord::Migration
  def change
    create_table :exif_names do |t|
      t.references :exifable, :null =>false, :polymorphic => true
      t.string :name, :null => false, :limit => 128
    end

    add_index :exif_names, [:exifable_type, :name], :unique => true
  end
end
