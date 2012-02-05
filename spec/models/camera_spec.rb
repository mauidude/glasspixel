require "spec_helper"

describe Camera do
  subject { Factory :camera }

  it { should belong_to :brand }

  it { should validate_uniqueness_of(:url_name).case_insensitive }
  it { should validate_presence_of :url_name }
  it { should ensure_length_of(:url_name).is_at_most  50 }

  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most 50 }

  context "#to_param" do
    it "should be equal #url_name" do
      subject.to_param.should == subject.url_name
    end
  end

  context "#find_by_id" do
    it "should do lookup on url name" do
      Camera.find_by_id(subject.url_name).should == subject
    end
  end
end