class Lens < ActiveRecord::Base
  include Exifable

  belongs_to :brand

  validates :name,
            :presence => true,
            :length => { :maximum => 50 }

  validates :url_name,
            :presence => true,
            :length => { :maximum => 50 },
            :uniqueness =>  { :case_sensitive => false }

  validates :minimum_focal_range,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than => 0 }

  validates :maximum_focal_range,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than => 0 }

  def self.find_by_id(url_name)
    Brand.find_by_url_name(url_name)
  end

  def to_param
    url_name
  end

  def fixed_length?
    minimum_focal_range == maximum_focal_range
  end
end
