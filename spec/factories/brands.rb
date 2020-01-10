FactoryBot.define do
  factory :brand do
    name { "Nintendo" }

    trait :invalid do
      name { nil }
    end

    factory :invalid_brand, traits: [:invalid]
  end
end
