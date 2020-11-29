FactoryBot.define do
  factory :rating do
    user
    article
    rate { 5 }
  end
end
