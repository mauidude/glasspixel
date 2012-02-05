# Read about factories at http://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

Factory.define :photo_metadata do |m|
  m.photo { fixture_file_upload("spec/assets/images/IMG_1299.JPG", "image/jpeg") }
end
