FactoryBot.define do
  factory :item do
    name { "C64" }

    trait :invalid do
      name { nil }
    end

    factory :invalid_item, traits: [:invalid]
  end
end
