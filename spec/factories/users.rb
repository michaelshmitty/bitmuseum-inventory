FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password { "verysecret" }

    trait :invalid do
      email { nil }
    end

    factory :invalid_user, traits: [:invalid]
  end
end
