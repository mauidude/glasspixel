class Brand < ActiveRecord::Base
  has_many :cameras
  has_many :lenses

  validates :name,
            :presence => true,
            :length => { :maximum => 50 }

  validates :url_name,
            :presence => true,
            :length => { :maximum => 50 },
            :uniqueness =>  { :case_sensitive => false }

  def self.find_by_id(url_name)
    Brand.find_by_url_name(url_name)
  end

  def to_param
    url_name
  end

end
