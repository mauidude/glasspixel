class ExifName < ActiveRecord::Base
  belongs_to :exifable, :polymorphic => true, :dependent => :destroy

  validates :name,
            :presence => true,
            :length => { :maximum => 128 },
            :uniqueness => { :scope => :exifable_type }

  validates :exifable_id,
            :presence => true

  validates :exifable_type,
            :presence => true,
            :length => { :maximum => 50 }
end
