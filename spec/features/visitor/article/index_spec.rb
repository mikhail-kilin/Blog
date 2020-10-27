require "rails_helper"

feature "View Articles" do
  let(:user) { create :user }
  let(:company) { create :company, owner: user }
  let!(:draft_article) { create :article, :draft, :company, user: user, company: company }
  let!(:published_article) { create :article, :published, :company, user: user, company: company }

  before do
    visit company_path(company)
  end

  scenario "Visitor can see only published articles" do
    expect(page).not_to have_content(draft_article.title)
    expect(page).to have_content(published_article.title)
  end

  context "we have 20 articles" do
    let!(:list_articles) { create_list :article, 20, :published, user: user, company: company }

    scenario "Visitor can see search articles by title" do
      article = list_articles.last

      expect(page).not_to have_content(article.title)

      first_title_word = article.title.split(" ").last

      fill_in :search_data, with: first_title_word

      click_on "Search"

      expect(page).to have_content(article.title)
    end

    scenario "Visitor can see search articles by content" do
      article = list_articles.last

      expect(page).not_to have_content(article.title)

      first_content_word = article.content.split(" ").last

      fill_in :search_data, with: first_content_word

      click_on "Search"

      expect(page).to have_content(article.title)
    end
  end
end
