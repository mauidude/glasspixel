require 'spec_helper'

describe Lens do
  describe "inflections" do
    it "should map lens to lenses" do
      "lens".pluralize.should == "lenses"
    end

    it "should map lenses to lens" do
      "lenses".singularize.should == "lens"
    end
  end

  subject { Factory(:lens) }

  it { should belong_to :brand }

  it { should validate_uniqueness_of(:url_name).case_insensitive }
  it { should validate_presence_of :url_name }
  it { should ensure_length_of(:url_name).is_at_most  50 }

  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most 50 }

  it { should validate_numericality_of :minimum_focal_range }
  it { should validate_numericality_of :maximum_focal_range }

  its(:to_param) { should == "ef 70-200mm f4l usm telephoto zoom" }
end
