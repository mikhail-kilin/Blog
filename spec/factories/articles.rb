FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end

  trait :draft do
    status { "draft" }
  end

  trait :published do
    status { "published" }
  end

  trait :company do
    company
    user
  end
end
