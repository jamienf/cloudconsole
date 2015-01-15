require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :band do
    sequence(:name) {|n| "Number #{n} Band"}
    bio "This band is wonderful!"
    genre "Punk"
  end

  factory :song do
    sequence(:title) {|n| "#{n + 1} bottles of beer"}
    tempo "180"
    band
  end
end
