FactoryBot.create(:user, email: "user@example.com")
20.times do
  FactoryBot.create_list :article, 10
end
