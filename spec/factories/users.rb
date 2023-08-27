FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
    active { true }

    trait :admin do
      role { 1 }
    end

    trait :user do
      role { 0 }
    end
  end
end
