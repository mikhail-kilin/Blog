FactoryBot.create(:user, email: "user@example.com")
20.times do
  FactoryBot.create(:article)
end