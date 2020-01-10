FactoryBot.define do
  factory :owner do
    name { "John" }

    trait :invalid do
      name { nil }
    end

    factory :invalid_owner, traits: [:invalid]
  end
end
