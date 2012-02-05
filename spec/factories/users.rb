# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "johndoe@example.com"
    password "mypassword"
    password_confirmation "mypassword"
  end
end
