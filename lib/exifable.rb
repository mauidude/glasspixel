module Exifable
  def self.included(base)
    base.has_many :exif_names, :as => :exifable, :autosave => true

    base.send :extend, ClassMethods
  end

  module ClassMethods
    def find_by_exif_name(name)
      self.joins(:exif_names).where(:exif_names => { :name => name }).first
    end
  end
end