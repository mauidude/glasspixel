class Rating < ActiveRecord::Base
  belongs_to :photo_metadata

  validates :value,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5 }

  validates :photo_metadata_id,
            :presence => true
end
