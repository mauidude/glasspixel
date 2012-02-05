class CreatePhotoMetadata < ActiveRecord::Migration
  def change
    create_table :photo_metadata do |t|
      t.references :brand
      t.references :camera
      t.references :lens
      t.date :taken_at
      t.float :exposure_time
      t.string :f_number
      t.string :iso
      t.float :focal_length
      t.float :latitude
      t.float :longitude
      t.string :orientation

      t.text :exif
      t.has_attached_file :photo

      t.timestamps
    end
  end
end
