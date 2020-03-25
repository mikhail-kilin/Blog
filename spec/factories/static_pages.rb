FactoryBot.define do
  factory :static_page do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end
end
