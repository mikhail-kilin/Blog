FactoryBot.create(:user, email: "user@example.com")
FactoryBot.create_list :article, 20
FactoryBot.create(:static_page, title: "About me", slug: "about-me")
