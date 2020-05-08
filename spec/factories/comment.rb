FactoryBot.define do
  factory :comment do
    user
    article
    content { Faker::Lorem.paragraph }
  end
end
