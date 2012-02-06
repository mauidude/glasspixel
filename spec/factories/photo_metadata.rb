# Read about factories at http://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :photo_metadata do
    photo { fixture_file_upload("spec/assets/images/IMG_1299.JPG", "image/jpeg") }
    width 100
    height 100
    rating_sum  0
    rating_count 0

    factory :rated_photo_metadata do
      rating_sum 20
      rating_count 8
    end
  end
end
