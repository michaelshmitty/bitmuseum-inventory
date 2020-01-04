FactoryBot.define do
  factory :category do
    name { "Computers" }

    trait :invalid do
      name { nil }
    end

    factory :invalid_category, traits: [:invalid]
  end
end
