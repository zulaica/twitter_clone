FactoryGirl.define do
  factory :user do
    email "user@domain.tld"
    password "password123"
    password_confirmation "password123"
  end
end
