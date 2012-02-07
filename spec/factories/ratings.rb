# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :rating do
    photo_metadata
    value 3
  end
end
