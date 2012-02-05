# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :exif_name do
    name "Canon PowerShot S500"
    exifable_type "Camera"
    exifable_id 1
  end
end
