require 'spec_helper'

describe ExifName do
  subject { Factory :exif_name }

  it { should belong_to :exifable }

  it { should validate_uniqueness_of(:name).scoped_to(:exifable_type) }
  it { should ensure_length_of(:name).is_at_most 128 }
  it { should validate_presence_of :name }

  it { should validate_presence_of :exifable_id }

  it { should validate_presence_of :exifable_type }
  it { should ensure_length_of(:exifable_type).is_at_most 50 }
end
