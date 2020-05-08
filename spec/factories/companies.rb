FactoryBot.define do
  factory :company do
    name { Faker::Lorem.sentence }
    slug { Faker::Lorem.sentence.parameterize }
    owner { FactoryBot.create :user }
  end
end
