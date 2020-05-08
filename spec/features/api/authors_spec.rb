require "rails_helper"

feature "Get Articles" do
  let!(:user) { FactoryBot.create :user }
  let!(:company) { FactoryBot.create :company, owner: user }

  background do
    FactoryBot.create_list :article, 2, :company, user: user, company: company
    visit articles_v1_author_path(user)
  end

  scenario "I can get articles of author" do
    expect(page).to have_content(Article.first.content)
    expect(page).to have_content(Article.first.title)
    expect(page).to have_content(Article.last.title)
    expect(page).to have_content(Article.last.content)
  end
end
