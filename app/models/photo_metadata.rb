class PhotoMetadata < ActiveRecord::Base
  belongs_to :brand
  belongs_to :camera
  belongs_to :lens
  has_many :ratings

  validates :width,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than => 0 }

  validates :height,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than => 0 }

  has_attached_file :photo,
                    :styles =>
                        {
                          :small => "32x32",
                          :medium => "64x64",
                          :large => "128x128",
                          :full => "800x800"
                        }

  validates_attachment_presence :photo, :on => :create
  validates_attachment_content_type :photo,
                                    :content_type => [ 'image/jpeg' ],
                                    :message => 'file must be a JPEG'

  validates_attachment_size :photo, :less_than => 10.megabytes

  serialize :exif, Hash

  attr_accessible :photo

  def raw_exif
    extract_exif_data if @raw_exif.nil?

    @raw_exif
  end

  def rating
    ratings_count == 0 ? 0 : (ratings_sum / ratings_count.to_f)
  end

  private
  def extract_exif_data
    @raw_exif = EXIFR::JPEG.new(photo.uploaded_file.open)

    make_name = @raw_exif.make
    model_name = @raw_exif.model
    #lens_name = @raw_exif.lens_model

    self.brand = Brand.find_by_exif_name(make_name) unless model_name.blank?
    self.camera = Camera.find_by_exif_name(model_name) unless model_name.blank?
    #self.lens = Lens.find_by_exif_name(lens_name) unless lens_name.blank?

    self.taken_at = @raw_exif.date_time_original
    self.exposure_time = @raw_exif.try(:exposure_time)
    self.f_number = @raw_exif.exif.try(:f_number)
    self.iso = @raw_exif.exif.try(:iso_speed_ratings)
    self.focal_length = @raw_exif.exif.try(:focal_length)
    self.latitude = @raw_exif.gps.try(:latitude)
    self.longitude = @raw_exif.gps.try(:longitude)
    self.orientation = @raw_exif.try(:orientation)
    self.width = @raw_exif.try(:width)
    self.height = @raw_exif.try(:height)


    self.exif = @raw_exif.to_hash
  end
end
