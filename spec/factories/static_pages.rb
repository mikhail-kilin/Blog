FactoryBot.define do
  factory :static_page do
    sentence = Faker::Lorem.sentence
    title { sentence }
    content { Faker::Lorem.paragraph }
    slug { sentence.parameterize }
  end
end
