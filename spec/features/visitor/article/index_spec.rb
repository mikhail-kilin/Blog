require "rails_helper"

feature "View Articles" do
  background do
    FactoryBot.create_list :article, 20, :published
    visit articles_path
  end

  scenario "Visitor can see sorted paginated articles" do
    articles = Article.order(created_at: :desc)

    expect(page).to have_content(articles.first.title)
    expect(page).not_to have_content(articles.last.title)

    click_on "Last »"

    expect(page).not_to have_content(articles.first.title)
    expect(page).to have_content(articles.last.title)
  end

  scenario "Visitor can see only published articles" do
    art = FactoryBot.create :article, :draft
    expect(page).not_to have_content(art.title)
  end
end
