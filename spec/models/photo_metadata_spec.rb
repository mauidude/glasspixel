require 'spec_helper'

describe PhotoMetadata do

  subject { Factory :photo_metadata }

  it { should belong_to :brand }
  it { should belong_to :camera }
  it { should belong_to :lens }

  it { should validate_presence_of :width }
  it { should validate_presence_of :height }
  it { should validate_numericality_of :width }
  it { should validate_numericality_of :height }

  it { should allow_mass_assignment_of :photo }
  it { should_not allow_mass_assignment_of :raw_exif }

  it { should have_attached_file(:photo) }
  it { should validate_attachment_presence(:photo) }
  it { should validate_attachment_content_type(:photo).
                allowing('image/jpeg').
                rejecting('image/png', 'image/gif') }
  it { should validate_attachment_size(:photo).less_than(10.megabytes) }

  context "exif parsing" do
    its(:raw_exif) { should_not be_nil }

    context "sets property" do
      before do

        @brand = Brand.new(:name => "Canon", :url_name => "canon")
        @camera = @brand.cameras.build(:name => "Digital Rebel XSi", :url_name => "digital rebel xsi")
        #@lens = @brand.lenses.build(:name => "EF24-105mm f/4L IS USM",
        #                            :url_name => "ef 24-105mm f4l is usm",
        #                            :minimum_focal_range => 24,
        #                            :maximum_focal_range => 105)

        @brand.save!

        @brand.exif_names.create(:name => "Canon")
        @camera.exif_names.create(:name => "Canon EOS DIGITAL REBEL XSi")
        #@lens.exif_names.create(:name => "EF24-105mm f/4L IS USM")

        #build raw_exif
        subject.raw_exif
      end

      its (:exposure_time) { should == 1/60.0 }
      its (:taken_at) { should == Time.new(2010, 11, 25, 13, 34, 17) }
      its (:f_number) { should == 4.0 }
      its (:iso) { should == 100 }
      its (:focal_length) { should == 24.0 }
      its (:orientation) { should == EXIFR::TIFF::Orientation.new(1,:TopLeft) }
      its (:camera) { should == @camera }
      its (:brand) { should == @brand }
      its (:width) { should == 4272 }
      its (:height) { should == 2848 }
      #its (:lens) { should == @lens }
      it "should read lens data"
    end

  end
end
