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

  context "with created 20 articles" do
    let!(:list_articles) { create_list :article, 20, :published, user: user, company: company }
    let(:another_user) { create :user }
    let!(:article_from_another_author) { create :article, :published, user: another_user, company: company }
    let(:last_article) { list_articles.last }

    scenario "Visitor can see search articles by title" do
      expect(page).not_to have_content(last_article.title)

      first_title_word = last_article.title.split(" ").last

      fill_in :search_data, with: first_title_word

      click_on "Search"

      expect(page).to have_content(last_article.title)
    end

    scenario "Visitor can see search articles by content" do
      expect(page).not_to have_content(last_article.title)

      first_content_word = last_article.content.split(" ").last

      fill_in :search_data, with: first_content_word

      click_on "Search"

      expect(page).to have_content(last_article.title)
    end

    scenario "Visitor can see search articles by author name" do
      fill_in :search_data, with: another_user.full_name

      click_on "Search"

      expect(page).to have_content(article_from_another_author.title)
    end
  end
end
