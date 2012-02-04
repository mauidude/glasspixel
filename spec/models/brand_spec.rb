require 'spec_helper'

describe Brand do
  subject { Factory(:brand) }

  it { should have_many :cameras }
  it { should have_many :lenses }

  it { should validate_uniqueness_of(:url_name).case_insensitive }
  it { should validate_presence_of :url_name }
  it { should ensure_length_of(:url_name).is_at_most  50 }

  it { should validate_presence_of :name }
  it { should ensure_length_of(:name).is_at_most 50 }

  its(:to_param) { should == "canon" }
end