require 'spec_helper'

describe Rating do
  subject { Factory :rating }

  it { should belong_to :photo_metadata }

  it { should validate_numericality_of :value }

  it { should allow_value(1).for(:value) }
  it { should allow_value(2).for(:value) }
  it { should allow_value(3).for(:value) }
  it { should allow_value(4).for(:value) }
  it { should allow_value(5).for(:value) }

  it { should_not allow_value(0).for(:value) }
  it { should_not allow_value(6).for(:value) }

  it { should validate_presence_of :photo_metadata_id }
end
