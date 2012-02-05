class PhotoMetadata < ActiveRecord::Base
  has_attached_file :photo,
                    :styles =>
                        {
                          :small => "32x32",
                          :medium => "64x64",
                          :large => "128x128",
                          :full => "800x800"
                        }

  validates_attachment_presence :photo
  validates_attachment_content_type :photo,
                                    :content_type => [ 'image/jpeg' ],
                                    :message => 'file must be a JPEG'

  validates_attachment_size :photo, :less_than => 10.megabytes

  serialize :exif, Hash



  #before_validation :extract_exif_data, :on => :create

  def raw_exif
    extract_exif_data if @raw_exif.nil?

    @raw_exif
  end

  private
  def extract_exif_data
    @raw_exif = EXIFR::JPEG.new(photo.uploaded_file.open)

    #model_name = @raw_exif.model
    #lens_name = @raw_exif.maker_note.lens

    self.taken_at = @raw_exif.date_time_original
    self.exposure_time = @raw_exif.try(:exposure_time)
    self.f_number = @raw_exif.exif.try(:f_number)
    self.iso = @raw_exif.exif.try(:iso_speed_ratings)
    self.focal_length = @raw_exif.exif.try(:focal_length)
    self.latitude = @raw_exif.gps.try(:latitude)
    self.longitude = @raw_exif.gps.try(:longitude)
    self.orientation = @raw_exif.try(:orientation)


    self.exif = @raw_exif.to_hash
  end
end
