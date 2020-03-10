FactoryBot.define do
  sequence(:email) { Faker::Internet.email }
  sequence(:title) { |n| "#{Faker::Lorem.words.join(' ')} #{n}" }
  sequence(:content) { |n| "Content #{n}" }
  sequence(:status) { |n| n.even? ? "draft" : "published" }
end
