require 'spec_helper'

describe PhotoMetadata do

  subject { Factory :photo_metadata }


  it { should have_attached_file(:photo) }
  it { should validate_attachment_presence(:photo) }
  it { should validate_attachment_content_type(:photo).
                allowing('image/jpeg').
                rejecting('image/png', 'image/gif') }
  it { should validate_attachment_size(:photo).less_than(10.megabytes) }


  context "exif parsing" do
    its(:raw_exif) { should_not be_nil }

    context "sets properties" do
      before do
        #build raw_exif
        subject.raw_exif
      end
      its (:exposure_time) { should == 1/60.0 }
      its (:taken_at) { should == Time.new(2010, 11, 25, 13, 34, 17) }
      its (:f_number) { should == 4.0 }
      its (:iso) { should == 100 }
      its (:focal_length) { should == 24.0 }
      its (:orientation) { should == EXIFR::TIFF::Orientation.new(1,:TopLeft) }
    end

  end
end
