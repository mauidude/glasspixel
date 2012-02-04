module Exifable
  def self.included(base)
    base.has_many :exif_names, :as => :exifable, :autosave => true
  end
end