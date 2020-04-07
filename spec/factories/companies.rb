FactoryBot.define do
  factory :company do
    sentence = Faker::Lorem.sentence
    name { sentence }
    slug { sentence.parameterize }
  end
end
