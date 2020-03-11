FactoryBot.define do
  sequence(:email) { Faker::Internet.email }
end
