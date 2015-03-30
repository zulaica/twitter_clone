FactoryGirl.define do
  factory :user do
    username "user"
    email "user@domain.tld"
    password "password123"
    password_confirmation "password123"
  end
end
