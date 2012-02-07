# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lens do
    name "EF 70-200mm f/4L USM Telephoto Zoom"
    url_name "ef 70-200mm f4l usm telephoto zoom"
    brand
    minimum_focal_range 70
    maximum_focal_range 200
  end
end
