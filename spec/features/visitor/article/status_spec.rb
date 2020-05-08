require "rails_helper"

feature "Status of Article" do
  let!(:user) { FactoryBot.create :user }
  let!(:company) { FactoryBot.create :company, owner: user }
  let(:article) { FactoryBot.create :article, :company, user: user, company: company }

  background do
    FactoryBot.create :user
  end

  scenario "Admin publicates article" do
    visit article_path article
    expect(page).to have_content("Companies")
  end

  scenario "Admin hides article" do
    article.update status: :published
    visit article_path article
    expect(page).to have_content(article.content)
  end
end
