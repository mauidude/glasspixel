class Rating < ActiveRecord::Base
  belongs_to :photo_metadata, :counter_cache => true

  after_create :update_photo_metadata

  validates :value,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5 }

  validates :photo_metadata_id,
            :presence => true

  private

  def update_photo_metadata
    record_timestamps = PhotoMetadata.record_timestamps

    PhotoMetadata.record_timestamps = false

    photo_metadata.increment!(:ratings_sum, value)
    logger.debug("SAVED")

    PhotoMetadata.record_timestamps = record_timestamps
  end

end
